enum SkillSectionType {
  progressType,
  factType;

  String toJson() => name;
  static SkillSectionType fromJson(String json) => values.byName(json);
}
