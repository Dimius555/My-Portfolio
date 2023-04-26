import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/widgets/custom_app_bar.dart';
import 'package:portfolio/views/widgets/custom_avatar.dart';

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
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 280,
                color: theme.secondaryBackgroundColor,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: CustomAvatar(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
