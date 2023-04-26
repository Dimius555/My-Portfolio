import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/service_locator.dart';
import 'package:portfolio/views/widgets/custom_app_bar.dart';

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
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
