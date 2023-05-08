import 'package:portfolio/data/api/skills_api.dart';
import 'package:portfolio/data/models/skill_section_model.dart';
import 'package:portfolio/interfaces/repositories/skill_repositories.dart';

class SkillRepositoryImpl implements SkillRepository {
  SkillRepositoryImpl({required SkillsAPI skillsApi}) : _api = skillsApi;

  final SkillsAPI _api;

  @override
  Future<void> createSkillSection(SkillSectionModel section) {
    return _api.createSkillSection(section);
  }

  @override
  Future<List<SkillSectionModel>> fetchAllSkillSections() {
    return _api.fetchAllSkillSections();
  }

  @override
  Future<SkillSectionModel> fetchSkillSectionById(String id) {
    return _api.fetchSkillSectionById(id);
  }

  @override
  Future<void> removeSection(String id) {
    return _api.removeSection(id);
  }
}
