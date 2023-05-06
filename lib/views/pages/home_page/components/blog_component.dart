part of '../home_page.dart';

class _BlogComponent extends StatelessWidget {
  const _BlogComponent();

  final int _itemsCount = 3;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: size.width > AppConstants.mobileModeBorderWidth
            ? EdgeInsets.only(left: size.width * 0.16, right: size.width * 0.16, bottom: 24.0)
            : EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.last_blog_posts_title.tr(),
                    style: theme.regular1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.read_more.tr(),
                        style: theme.buttonStyle.copyWith(color: theme.linksColor, fontSize: 14),
                      )),
                ],
              ),
            ),
            size.width > AppConstants.mobileModeBorderWidth
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      PostMinimizedWidget(),
                      PostMinimizedWidget(),
                    ],
                  )
                : Column(
                    children: const [
                      PostMinimizedWidget(),
                      SizedBox(height: 20),
                      PostMinimizedWidget(),
                    ],
                  ),
          ],
        ));
  }
}
