import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/widgets/custom_footer_bar.dart';
import 'package:portfolio/views/widgets/custom_sliver_header_delegate.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key}) {
    sl<ThemeNotifier>().addListener(() {});
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Scaffold(
      // appBar: const CustomAppBar(),

      body: CustomScrollView(slivers: [
        const SliverPersistentHeader(
          pinned: true,
          delegate: CustomSliverHeaderDelegate(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) {
              if (index == 19) {
                return const CustomFooterBar();
              }
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Test'),
              );
            },
          ),
        )
      ]),
    );
  }
}
