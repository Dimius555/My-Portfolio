import 'dart:html';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/localization/locale_keys.g.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/config/app_setup/service_locator.dart';
import 'package:portfolio/views/widgets/app_widgets/post_minimized_widget.dart';
import 'package:portfolio/views/widgets/app_widgets/project_minimized_widget.dart';
import 'package:portfolio/views/widgets/app_widgets/tech_container_widget.dart';
import 'package:portfolio/views/widgets/custom/custom_app_bar.dart';
import 'package:portfolio/views/widgets/custom/custom_avatar.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/config/constants/links.dart';

part 'components/header_component.dart';
part 'components/skills_component.dart';
part 'components/works_component.dart';
part 'components/blog_component.dart';
part 'components/footer_component.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _HeaderComponent(),
          _SkillsComponent(),
          _WorksComponent(),
          _BlogComponent(),
          _FooterComponent(),
        ],
      ),
    ));
  }
}
