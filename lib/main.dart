import 'package:flutter/material.dart';

import './app.dart';
import './constant/config.dart';
import './util/injection/injection.dart';

void main() async {
  await setUp();
  runApp(App());
}

void setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Config.APP_MODE);
}
