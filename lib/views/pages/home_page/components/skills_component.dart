part of '../home_page.dart';

class _SkillsComponent extends StatelessWidget {
  const _SkillsComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Container(
        color: theme.primaryBackgroundColor,
        child: size.width > AppConstants.mobileModeBorderWidth ? _webOrientation(theme, size) : _mobileOrientation(theme, size));
  }

  Widget _webOrientation(AppTheme theme, Size size) {
    return Column(
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
    );
  }

  Widget _mobileOrientation(AppTheme theme, Size size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.my_skills_title.tr(),
                style: theme.regular1,
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text(
                    LocaleKeys.view_more.tr(),
                    style: theme.buttonStyle.copyWith(color: theme.linksColor, fontSize: 14),
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            children: [
              TechContainerWidget(
                title: 'Flutter',
                icon: 'assets/icons/ic_flutter.png',
                description: LocaleKeys.skill_flutter_description.tr(),
              ),
              const SizedBox(height: 20),
              TechContainerWidget(
                title: 'Swift',
                icon: 'assets/icons/ic_swift.png',
                description: LocaleKeys.skill_ios_description.tr(),
              ),
              const SizedBox(height: 20),
              TechContainerWidget(
                title: 'Firebase',
                icon: 'assets/icons/ic_firebase.png',
                description: LocaleKeys.skill_firebase_description.tr(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
