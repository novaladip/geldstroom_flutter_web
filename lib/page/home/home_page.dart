import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../constant/app_styles.dart';
import '../../routes.dart';
import '../../util/util.dart';
import '../../widget/base_container/base_container.dart';
import '../../widget/widget.dart';
import '../page.dart';

const kTitleText = 'Welcome to Geldstroom';
const kSubtitleText = 'Start managing your money with us!';
const kLoginButtonText = 'Login';
const kRegisterButtonText = 'Register';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final dividerHeight =
        context.heightInPercent(context.sizeBuilder(base: 0.01, xs: 0.02));

    return Scaffold(
      body: BaseContainer(
          child: <Widget>[
        Text(kTitleText).fontSize(context.sizeBuilder(base: 20, xs: 16)),
        Text(kSubtitleText).fontSize(context.sizeBuilder(base: 18, xs: 15)),
        SizedBox(height: dividerHeight),
        <Widget>[
          MainButton(
            color: Colors.blue,
            loading: false,
            title: kLoginButtonText,
            onTap: () => Routes.router.navigateTo(context, LoginPage.routeName),
          ),
          MainButton(
            color: Colors.deepOrange,
            loading: false,
            title: kRegisterButtonText,
            onTap: () => Routes.router.navigateTo(context, LoginPage.routeName),
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      )).decorated(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppStyles.darkBackground, AppStyles.buttonColor],
        ),
      ),
    );
  }
}
