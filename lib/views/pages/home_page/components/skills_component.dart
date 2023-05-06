part of '../home_page.dart';

class _SkillsComponent extends StatelessWidget {
  const _SkillsComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Container(
      color: theme.primaryBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.my_skills_title.tr(),
                  style: theme.regular1,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.view_more.tr(),
                      style: theme.buttonStyle.copyWith(color: theme.linksColor, fontSize: 14),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 350,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TechContainerWidget(
                    title: 'Flutter',
                    icon: 'assets/icons/ic_flutter.png',
                    description: LocaleKeys.skill_flutter_description.tr(),
                  ),
                  TechContainerWidget(
                    title: 'Swift',
                    icon: 'assets/icons/ic_swift.png',
                    description: LocaleKeys.skill_ios_description.tr(),
                  ),
                  TechContainerWidget(
                    title: 'Firebase',
                    icon: 'assets/icons/ic_firebase.png',
                    description: LocaleKeys.skill_firebase_description.tr(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
