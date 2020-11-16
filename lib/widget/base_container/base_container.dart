import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../util/util.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    @required this.child,
    Key key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    ).width(context.width).padding(
          horizontal: context.sizeBuilder(
            xs: 6,
            sm: 40,
            md: 80,
            lg: 160,
            xl: 320,
          ),
        );
  }
}
