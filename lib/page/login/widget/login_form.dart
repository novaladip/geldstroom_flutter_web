import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../routes.dart';
import '../../../util/util.dart';
import '../../../util/validator/validator.dart';
import '../../../widget/widget.dart';
import '../../page.dart';

const kLoginFormEmailKey = Key('LOGIN_FORM_EMAIL_KEY');
const kLoginFormPasswordKey = Key('LOGIN_FORM_PASSWORD_KEY');
const kLoginSubmitButtonText = 'Sign in';
const kLoginForgotPasswordText = 'Forgot Password';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final form = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordFocusNode = FocusNode();

  void onSubmit() {
    final isValid = form.currentState.validate();
    if (!isValid) {
      return;
    }
    // @TODO
  }

  @override
  Widget build(BuildContext context) {
    return Styled.widget(
      child: Form(
        key: form,
        child: <Widget>[
          TextInput(
            key: kLoginFormEmailKey,
            labelText: 'Email',
            controller: email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: passwordFocusNode.requestFocus,
            validator: (value) => InputValidator.email(value, 'Email'),
          ),
          TextInput(
            key: kLoginFormPasswordKey,
            labelText: 'Password',
            controller: password,
            focusNode: passwordFocusNode,
            obscureText: true,
            textInputAction: TextInputAction.done,
            validator: (value) => InputValidator.required(value, 'Password'),
          ),
          SizedBox(height: context.sizeBuilder(base: 6, xs: 3)),
          Text(kLoginForgotPasswordText)
              .alignment(Alignment.centerRight)
              .gestures(
                onTap: () => Routes.router
                    .navigateTo(context, ResetPasswordPage.routeName),
              ),
          SizedBox(height: context.sizeBuilder(base: 10, xs: 8)),
          MainButton(
            onTap: onSubmit,
            title: kLoginSubmitButtonText,
            minWidth: context.sizeBuilder(base: 400, xs: 320),
          ),
        ].toColumn(),
      ).constrained(maxWidth: context.sizeBuilder(base: 400, xs: 320)),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
