part of '../home_page.dart';

class _HeaderComponent extends StatelessWidget {
  const _HeaderComponent();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Works',
                style: theme.buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Blog',
                style: theme.buttonStyle,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Contact',
                style: theme.buttonStyle,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.16, vertical: 44.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.home_title.tr(),
                      style: theme.header0,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      LocaleKeys.home_header_description.tr(),
                      style: theme.regular3,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const CustomAvatar(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.16, bottom: 44.0),
          child: CustomButton(onPressed: () {}, title: LocaleKeys.download_resume.tr()),
        ),
      ],
    );
  }
}
