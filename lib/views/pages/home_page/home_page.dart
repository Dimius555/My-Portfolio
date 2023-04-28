import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/pages/home_page/components/tech_pull_widget.dart';
import 'package:portfolio/views/widgets/custom_footer_bar.dart';
import 'package:portfolio/views/pages/home_page/components/custom_sliver_header_delegate.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key}) {
    sl<ThemeNotifier>().addListener(() {});
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _itemsCount = 2;
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: const CustomAppBar(),

      body: CustomScrollView(slivers: [
        const SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverHeaderDelegate(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: _itemsCount,
            (context, index) {
              if (index == _itemsCount - 1) {
                return _getWidget(index, size);
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.12 * size.width),
                child: _getWidget(index, size),
              );

              // return Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Text(
              //       "Pull of technologies",
              //       style: theme.header0,
              //     ));
            },
          ),
        )
      ]),
    );
  }

  Widget _getWidget(int index, Size size) {
    if (index == 0) {
      return TechPullWidget(
        screenSize: size,
      );
    }
    if (index == 1) {
      return const CustomFooterBar();
    }
    return Container();
  }
}
