part of '../skills_page.dart';

class _SkillsSectionComponent extends StatelessWidget {
  const _SkillsSectionComponent({
    required this.skills,
    required this.title,
    required this.tooltip,
    this.isOnlyMobile = false,
  });

  final String title;
  final String tooltip;
  final List<SkillModel> skills;
  final bool isOnlyMobile;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return isOnlyMobile
        ? _mobileOrientation(theme)
        : size.width > AppConstants.mobileModeBorderWidth
            ? _webOrientation(theme)
            : _mobileOrientation(theme);
  }

  Widget _webOrientation(AppTheme theme) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.header1,
            ),
            const SizedBox(width: 10),
            Tooltip(
              textAlign: TextAlign.center,
              message: tooltip,
              child: InkWell(
                  child: Icon(
                Icons.info_outline,
                color: theme.appSecondaryColor,
                size: 24,
              )),
            )
          ],
        ),
        const SizedBox(height: 32),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: skills.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 10,
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
            ),
            itemBuilder: (BuildContext ctx, index) {
              return _SkillComponent(
                skill: skills[index],
              );
            }),
        const SizedBox(height: 44),
      ],
    );
  }

  Widget _mobileOrientation(AppTheme theme) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: theme.header3,
            ),
            const SizedBox(width: 10),
            Tooltip(
              textAlign: TextAlign.center,
              message: tooltip,
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.info_outline,
                    color: theme.appSecondaryColor,
                    size: 24,
                  )),
            )
          ],
        ),
        const SizedBox(height: 32),
        ListView.builder(
            itemCount: skills.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _SkillComponent(
                  skill: skills[index],
                ),
              );
            }),
        const SizedBox(height: 44),
      ],
    );
  }
}
