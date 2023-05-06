part of '../home_page.dart';

class _BlogComponent extends StatelessWidget {
  const _BlogComponent();

  final int _itemsCount = 3;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(left: size.width * 0.16, right: size.width * 0.16, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Last blog posts',
                    style: theme.regular1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Read more',
                        style: theme.buttonStyle.copyWith(color: theme.linksColor, fontSize: 14),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                PostMinimizedWidget(),
                PostMinimizedWidget(),
              ],
            ),
          ],
        ));
  }
}
