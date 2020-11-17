import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    Key key,
  }) : super(key: key);

  static const routeName = '/reset/password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(routeName),
    );
  }
}
