import 'package:portfolio/data/models/skill_section_model.dart';

abstract class SkillRepository {
  Future<void> createSkillSection(SkillSectionModel section);
  Future<SkillSectionModel> fetchSkillSectionById(String id);
  Future<List<SkillSectionModel>> fetchAllSkillSections();
  Future<void> removeSection(String id);
}
