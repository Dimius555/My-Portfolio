import 'package:flutter/material.dart';
import 'package:portfolio/views/widgets/custom/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        onScrollValue: 1,
      ),
      body: Center(
        child: Text('About Me'),
      ),
    );
  }
}
