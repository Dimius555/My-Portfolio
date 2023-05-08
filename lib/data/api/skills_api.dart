import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/data/models/skill_section_model.dart';

class SkillsAPI {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createSkillSection(SkillSectionModel section) async {
    try {
      await _firestore.collection('skills').doc(section.id).set(section.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SkillSectionModel>> fetchAllSkillSections() async {
    try {
      final List<SkillSectionModel> sections = [];
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore.collection('skills').get();
      sections.addAll(querySnapshot.docs.map((e) => SkillSectionModel.fromJson(e.data())).toList());
      log('✅ Skill sections fetched. Amount: ${sections.length}');
      return sections;
    } catch (e) {
      log('🔥 Error fetching or parsing skill sections: $e');
      rethrow;
    }
  }

  Future<SkillSectionModel> fetchSkillSectionById(String id) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore.collection('skills').doc(id).get();
      if (documentSnapshot.data() == null) throw Exception('🔥 Skill section doesn\'t exist: $id');
      final section = SkillSectionModel.fromJson(documentSnapshot.data()!);
      log('✅ Skill section fetched. Amount: ${section.toJson()}');
      return section;
    } catch (e) {
      log('🔥 Error fetching or parsing skill section: $e');
      rethrow;
    }
  }

  Future<void> removeSection(String id) async {
    try {
      await _firestore.collection('skills').doc(id).delete();
      log('✅ Skill section deleted. ');
    } catch (e) {
      log('🔥 Error fetching or parsing skill section: $e');
      rethrow;
    }
  }
}
