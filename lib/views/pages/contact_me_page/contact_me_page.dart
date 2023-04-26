import 'package:flutter/material.dart';
import 'package:portfolio/views/widgets/custom_app_bar.dart';

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Contact Me'),
      ),
    );
  }
}
