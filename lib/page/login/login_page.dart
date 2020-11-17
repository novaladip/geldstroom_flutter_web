import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../util/util.dart';
import '../../widget/widget.dart';
import './widget/login_form.dart';

const kLoginTitleText = 'Geldstroom';
const kLoginSubtitleText = 'Sign in to your account';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(routeName),
      body: BaseContainer(
        child: SingleChildScrollView(
          child: <Widget>[
            Text(kLoginTitleText)
                .fontSize(context.sizeBuilder(base: 22, xs: 17)),
            Text(kLoginSubtitleText)
                .fontSize(context.sizeBuilder(base: 18, xs: 15)),
            SizedBox(height: context.heightInPercent(0.02)),
            LoginForm(),
          ].toColumn(),
        ).center(),
      ),
    );
  }
}
