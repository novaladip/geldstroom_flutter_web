import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../widget/base_container/base_container.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseContainer(
        child: Text('Home Page'),
      ).padding(top: 20),
    );
  }
}
