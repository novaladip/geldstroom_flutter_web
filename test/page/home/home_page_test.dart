import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/page/home/home_page.dart';
import 'package:geldstroom_web_flutter/page/page.dart';

import '../../test_helper.dart';

void main() {
  testWidgets(
      'HomePage should have a welcome text, login button and register button '
      'when login button is tapped should render LoginPage widget',
      (tester) async {
    await tester.pumpWidget(
      AppWrapper(HomePage()),
    );

    expect(find.text(kTitleText), findsOneWidget);
    expect(find.text(kLoginButtonText), findsOneWidget);
    expect(find.text(kRegisterButtonText), findsOneWidget);

    await tester.tap(find.text(kLoginButtonText));
    await tester.pumpAndSettle();
    expect(find.byKey(Key(LoginPage.routeName)), findsOneWidget);
  });
}
