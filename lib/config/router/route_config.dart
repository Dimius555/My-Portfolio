import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/views/admin/admin_pannel_page.dart';
import 'package:portfolio/views/admin/auth_admin_page.dart';
import 'package:portfolio/views/pages/about_page/about_page.dart';
import 'package:portfolio/views/pages/error_page/error_page.dart';
import 'package:portfolio/views/pages/home_page/home_page.dart';
import 'package:portfolio/views/pages/skills_page/skills_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: HomePage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: Routes.about,
        path: '/about',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const AboutPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: Routes.skills,
        path: '/skills',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: SkillsPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: Routes.authAdmin,
        path: '/auth_admin_${AppConstants.adminKey}',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: AuthAdminPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        name: Routes.adminPannel,
        path: '/admin_pannel',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const AdminPannelPage(),
              transitionsBuilder: (context, animation, secondAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              });
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return CustomTransitionPage(
          child: const ErrorPage(),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          });
    },
  );
}
