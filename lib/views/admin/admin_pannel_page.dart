import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/global/auth_cubit/auth_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/admin_menu.dart';
import 'package:portfolio/views/admin/admin_pannel_components/unauthorized_widget.dart';
import 'package:portfolio/views/admin/views/skills/skills_view.dart';

import 'admin_pannel_components/admin_app_bar.dart';

class AdminPannelPage extends StatefulWidget {
  const AdminPannelPage({super.key});

  @override
  State<AdminPannelPage> createState() => _AdminPannelPageState();
}

class _AdminPannelPageState extends State<AdminPannelPage> {
  @override
  void initState() {
    AuthCubit.read(context).checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = AuthCubit.watchState(context);
    final theme = AppTheme.read(context);
    if (!authState.isAuthorized) {
      return Scaffold(
        body: UnauthorizedWidget(
          pushAdminCallback: () {
            GoRouter.of(context).pushReplacementNamed(Routes.authAdmin);
          },
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          const AdminAppBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                flex: 1,
                child: SizedBox(child: AdminMenuWidget()),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 5,
                child: SkillsView(),
              )
            ],
          )
        ],
      ),
    );
  }
}
