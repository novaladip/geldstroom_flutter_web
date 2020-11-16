import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(routeName),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
