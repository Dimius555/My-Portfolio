import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/enums/enums.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/data/models/skill_section_model.dart';
import 'package:portfolio/interfaces/repositories/skill_repositories.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  static SkillsState watchState(BuildContext context) => context.watch<SkillsCubit>().state;
  static SkillsCubit read(BuildContext context) => context.read<SkillsCubit>();

  SkillsCubit({required SkillRepository skillRepository})
      : _skillRepository = skillRepository,
        super(SkillsState(isLoading: true, skillSections: []));

  final SkillRepository _skillRepository;

  // Skill sections

  void createSkillSection(String name, bool isProgressType, String tooltip) async {
    final SkillSectionModel sectionModel = SkillSectionModel(
      id: _generateID(),
      name: name,
      tooltip: tooltip,
      type: isProgressType ? SkillSectionType.progressType : SkillSectionType.factType,
      skills: [],
    );
    try {
      await _skillRepository.createSkillSection(sectionModel);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  void fetchAllSkillsSections() async {
    try {
      final sections = await _skillRepository.fetchAllSkillSections();
      emit(SkillsState(isLoading: false, skillSections: sections));
    } catch (e) {
      log(e.toString());
    }
  }

  void editSkillSection(SkillSectionModel sectionModel) async {
    try {
      await _skillRepository.createSkillSection(sectionModel);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  void removeSection(SkillSectionModel sectionModel) async {
    try {
      await _skillRepository.removeSection(sectionModel.id);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  // Skills

  void saveSkill(String name, String? info, double level, SkillSectionModel section) async {
    final SkillModel newSkill = SkillModel(
      id: _generateID(),
      name: name,
      level: level / 100,
      info: info,
    );
    final SkillSectionModel updatedSection = section.copyWith(skills: section.skills..add(newSkill));
    try {
      await _skillRepository.createSkillSection(updatedSection);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  void editSkill(SkillSectionModel section, SkillModel skill) async {
    final index = section.skills.indexWhere((element) => element.id == skill.id);
    final list = section.skills..removeAt(index);
    final updatedSection = section.copyWith(skills: list..insert(index, skill));
    try {
      await _skillRepository.createSkillSection(updatedSection);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  void removeSkill(SkillModel skill, SkillSectionModel section) async {
    final skills = section.skills..remove(skill);
    final SkillSectionModel updatedSection = section.copyWith(skills: skills);
    try {
      await _skillRepository.createSkillSection(updatedSection);
      fetchAllSkillsSections();
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }

  String _generateID() {
    String credentials = UniqueKey().hashCode.toString();
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(credentials);
  }
}
