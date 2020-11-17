import 'package:flutter_test/flutter_test.dart';
import 'package:geldstroom_web_flutter/page/login/login_page.dart';
import 'package:geldstroom_web_flutter/page/login/widget/login_form.dart';
import 'package:geldstroom_web_flutter/page/page.dart';
import 'package:geldstroom_web_flutter/widget/text_input/text_input.dart';

import '../../test_helper.dart';

void main() {
  group("LoginPage", () {
    testWidgets(
        'should render title, subtitle & and login form'
        'should react to user input properly', (tester) async {
      await tester.pumpWidget(
        AppWrapper(LoginPage()),
      );

      final emailInput = 'john@email.com';
      final passwordInput = 'somepsswrd';

      expect(find.text(kLoginTitleText), findsOneWidget);
      expect(find.text(kLoginSubtitleText), findsOneWidget);
      expect(find.text(kLoginForgotPasswordText), findsOneWidget);
      expect(find.text(kLoginSubmitButtonText), findsOneWidget);

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);

      await tester.enterText(find.byKey(kLoginFormEmailKey), emailInput);
      await tester.enterText(find.byKey(kLoginFormPasswordKey), passwordInput);
      expect(find.text(emailInput), findsOneWidget);
      expect(find.text(passwordInput), findsOneWidget);
    });

    testWidgets(
        'given an invalid input value '
        'should render validator error message', (tester) async {
      await tester.pumpWidget(
        AppWrapper(LoginPage()),
      );

      final emailInput = 'invalidemail@';
      final passwordInput = '';

      await tester.enterText(find.byKey(kLoginFormEmailKey), emailInput);
      await tester.enterText(find.byKey(kLoginFormPasswordKey), passwordInput);
      await tester.tap(find.text(kLoginSubmitButtonText));
      await tester.pump();

      expect(find.text('Invalid email address'), findsOneWidget);
      expect(find.text('Password is cannot be empty'), findsOneWidget);
    });

    testWidgets(
        'should focus to password field after submitting in email field ',
        (tester) async {
      await tester.pumpWidget(
        AppWrapper(LoginPage()),
      );

      final passwordFieldFinder = find.byKey(kLoginFormPasswordKey).first;
      final passwordInput = tester.firstWidget<TextInput>(passwordFieldFinder);
      expect(passwordInput.focusNode.hasFocus, false);

      // simulate user enter an email and pressing next button in keyboard
      await tester.enterText(find.byKey(kLoginFormEmailKey), 'value');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(passwordInput.focusNode.hasFocus, true);
    });

    testWidgets(
        'when forgot password text pressed '
        'should navigate to ResetPasswordPage', (tester) async {
      await tester.pumpWidget(
        AppWrapper(LoginPage()),
      );

      await tester.tap(find.text(kLoginForgotPasswordText));
      await tester.pumpAndSettle();

      expect(find.text(ResetPasswordPage.routeName), findsOneWidget);
    });
  });
}
