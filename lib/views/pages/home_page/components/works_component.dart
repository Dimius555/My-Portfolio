part of '../home_page.dart';

class _WorksComponent extends StatelessWidget {
  const _WorksComponent();

  final int _itemsCount = 3;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.16, right: size.width * 0.16, top: 16.0),
      child: ListView.builder(
        itemCount: _itemsCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Featured works',
                style: theme.regular1,
              ),
            );
          }
          return const ProjectMinimizedWidget();
        }),
      ),
    );
  }
}
