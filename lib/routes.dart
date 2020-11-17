import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './page/page.dart';

typedef CreateHandler = Widget Function(
  BuildContext context,
  Map<String, List<String>> parameters,
);

class _AppRouter {
  const _AppRouter(
    this.routeName,
    this.widget,
  );

  final String routeName;
  final Widget widget;
}

class Routes {
  static FluroRouter router;

  static void configureRoutes() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) => HomePage(),
    );

    final appRouters = [
      _AppRouter(HomePage.routeName, HomePage()),
      _AppRouter(OnboardingPage.routeName, OnboardingPage()),
      _AppRouter(LoginPage.routeName, LoginPage()),
      _AppRouter(ResetPasswordPage.routeName, ResetPasswordPage()),
    ];

    for (var appRouter in appRouters) {
      router.define(
        appRouter.routeName,
        handler: createHandler((context, parameters) => appRouter.widget),
      );
    }
  }

  // createHandler
  // A helper function to create fluro handler
  static Handler createHandler(CreateHandler handler) {
    return Handler(
      handlerFunc: handler,
    );
  }
}
