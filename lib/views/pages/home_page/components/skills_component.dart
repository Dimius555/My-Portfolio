part of '../home_page.dart';

class _SkillsComponent extends StatelessWidget {
  const _SkillsComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Container(
      color: theme.secondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My skills',
                    style: theme.header2,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'View more',
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
      ),
    );
  }
}
