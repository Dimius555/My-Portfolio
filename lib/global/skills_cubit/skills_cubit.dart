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

  void createSkillSection(String name, bool isProgressType, String tooltip) async {
    String credentials = UniqueKey().hashCode.toString();
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final SkillSectionModel sectionModel = SkillSectionModel(
      id: stringToBase64.encode(credentials),
      name: name,
      tooltip: tooltip,
      type: isProgressType ? SkillSectionType.progressType : SkillSectionType.factType,
      skills: [SkillModel(id: '123', name: 'TestSkill', level: 0.8)],
    );
    try {
      await _skillRepository.createSkillSection(sectionModel);
    } catch (e) {
      //TODO
      log(e.toString());
    }
  }
}
