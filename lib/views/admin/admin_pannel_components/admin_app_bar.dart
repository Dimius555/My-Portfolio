// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/global/auth_cubit/auth_cubit.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, 44);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AppTheme.read(context);

    return AppBar(
      backgroundColor: theme.linksColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Admin pannel',
        style: theme.header2.copyWith(color: theme.primaryBackgroundColor),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
              onPressed: () {
                AuthCubit.read(context).logout();
                GoRouter.of(context).pushReplacementNamed(Routes.home);
              },
              icon: Icon(
                Icons.logout,
                color: theme.primaryBackgroundColor,
              )),
        )
      ],
    );
  }
}
