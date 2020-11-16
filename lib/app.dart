import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './constant/app_styles.dart';
import './routes.dart';

class App extends StatelessWidget {
  App() {
    final router = FluroRouter();
    Routes.router = router;
    Routes.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppStyles.primaryColor,
        accentColor: AppStyles.secondaryColor,
        scaffoldBackgroundColor: AppStyles.darkBackground,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppStyles.textLight,
              displayColor: AppStyles.textLight,
              fontFamily: GoogleFonts.acme().fontFamily,
            ),
      ),
      onGenerateRoute: Routes.router.generator,
    );
  }
}
