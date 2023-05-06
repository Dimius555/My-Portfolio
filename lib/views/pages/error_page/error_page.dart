import 'package:flutter/material.dart';
import 'package:portfolio/views/widgets/custom/custom_app_bar.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("Page you are loking for doesn't exist"),
      ),
    );
  }
}
