import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/views/pages/contact_me_page/contact_me_page.dart';
import 'package:portfolio/views/pages/error_page/error_page.dart';
import 'package:portfolio/views/pages/home_page/home_page.dart';
import 'package:portfolio/views/pages/projects_page/projects_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: Routes.contactMe,
        path: '/contact_me',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ContactMePage());
        },
      ),
      GoRoute(
        name: Routes.projects,
        path: '/projects',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ProjectsPage());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );
}
