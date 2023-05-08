part of '../skills_view.dart';

class _SkillComponent extends StatelessWidget {
  const _SkillComponent({
    required this.skill,
    required this.section,
  });

  final SkillSectionModel section;
  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      skill.name,
                      style: size.width > AppConstants.mobileModeBorderWidth ? theme.regular2 : theme.regular3,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (cntxt) {
                                return AddOrEditSkillDialog(section: section, skillModel: skill);
                              });
                        },
                        icon: Icon(Icons.edit_outlined, color: theme.linksColor, size: 18)),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          SkillsCubit.read(context).removeSkill(skill, section);
                        },
                        icon: Icon(Icons.delete_outline, color: theme.linksColor, size: 18))
                  ],
                ),
                Text(
                  '${skill.level * 100}%',
                  style: theme.regular4,
                ),
              ],
            ),
          ),
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            tween: Tween(
              begin: 0,
              end: skill.level,
            ),
            builder: (context, value, _) => Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 8,
                color: _getSkillColor(theme),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getSkillColor(AppTheme theme) {
    final value = skill.level;

    if (value >= 0.9) {
      return theme.accentPositiveColor;
    } else if (value >= 0.7 && value < 0.9) {
      return theme.accentWarningColor;
    } else if (value >= 0.6 && value < 0.7) {
      return theme.appSecondaryColor;
    } else {
      return theme.accentNegativeColor;
    }
  }
}
