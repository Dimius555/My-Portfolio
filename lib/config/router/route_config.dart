import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/views/pages/about_page/about_page.dart';
import 'package:portfolio/views/pages/error_page/error_page.dart';
import 'package:portfolio/views/pages/home_page/home_page.dart';

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
      // GoRoute(
      //   name: Routes.projects,
      //   path: '/projects',
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //         child: const ProjectsPage(),
      //         transitionsBuilder: (context, animation, secondAnimation, child) {
      //           return FadeTransition(
      //             opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
      //             child: child,
      //           );
      //         });
      //   },
      // ),
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
