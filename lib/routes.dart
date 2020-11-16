import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './page/page.dart';

typedef CreateHandler = Widget Function(
  BuildContext context,
  Map<String, List<String>> parameters,
);

class Routes {
  static FluroRouter router;

  static void configureRoutes() {
    router.notFoundHandler = Handler(
      handlerFunc: (context, params) => HomePage(),
    );

    router.define(
      HomePage.routeName,
      handler: createHandler((context, parameters) => HomePage()),
    );

    router.define(
      LoginPage.routeName,
      handler: createHandler((context, parameters) => LoginPage()),
    );
  }

  // createHandler
  // A helper function to create fluro handler
  static Handler createHandler(CreateHandler handler) {
    return Handler(
      handlerFunc: handler,
    );
  }
}
