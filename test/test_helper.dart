import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:geldstroom_web_flutter/routes.dart';

class AppWrapper extends StatelessWidget {
  AppWrapper(this.child) {
    final router = FluroRouter();
    Routes.router = router;
    Routes.configureRoutes();
  }

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.router.generator,
      home: child,
    );
  }
}
