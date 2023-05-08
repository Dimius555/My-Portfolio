class SkillModel {
  late String id;
  late String name;
  late double level;
  late String? info;

  SkillModel({
    required this.id,
    required this.name,
    required this.level,
    this.info,
  });

  SkillModel copyWith({String? name, double? level, String? info}) {
    return SkillModel(
      id: id,
      name: name ?? this.name,
      level: level ?? this.level,
      info: info ?? this.info,
    );
  }

  static SkillModel fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['level'] = level;
    map['info'] = info;
    return map;
  }
}
