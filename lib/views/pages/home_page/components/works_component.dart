part of '../home_page.dart';

class _WorksComponent extends StatelessWidget {
  const _WorksComponent();

  final int _itemsCount = 3;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: size.width > AppConstants.mobileModeBorderWidth
          ? EdgeInsets.only(left: size.width * 0.16, right: size.width * 0.16, top: 16.0)
          : EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1, top: 16.0),
      child: ListView.builder(
        itemCount: _itemsCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.featured_works_title.tr(),
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
            );
          }
          return const ProjectMinimizedWidget();
        }),
      ),
    );
  }
}
