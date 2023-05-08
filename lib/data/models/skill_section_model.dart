import 'package:portfolio/data/enums/enums.dart';
import 'package:portfolio/data/models/skill_model.dart';

class SkillSectionModel {
  late String id;
  late String name;
  late String tooltip;
  late SkillSectionType type;
  late List<SkillModel> skills;

  SkillSectionModel({
    required this.id,
    required this.name,
    required this.tooltip,
    required this.type,
    required this.skills,
  });

  SkillSectionModel copyWith({String? name, String? tooltip, List<SkillModel>? skills}) {
    return SkillSectionModel(
      id: id,
      name: name ?? this.name,
      tooltip: tooltip ?? this.tooltip,
      type: type,
      skills: skills ?? this.skills,
    );
  }

  static SkillSectionModel fromJson(Map<String, dynamic> json) {
    return SkillSectionModel(
      id: json['id'],
      name: json['name'],
      tooltip: json['tooltip'],
      type: SkillSectionType.fromJson(json['type']),
      skills: (json['skills'] != null && json['skills'] is List)
          ? (json['skills'] as List<dynamic>).map((e) => SkillModel.fromJson(e as Map<String, dynamic>)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['tooltip'] = tooltip;
    map['type'] = type.toJson();
    map['skills'] = skills.map((e) => e.toJson()).toList();
    return map;
  }
}
