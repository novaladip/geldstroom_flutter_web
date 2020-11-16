import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../constant/app_styles.dart';
import '../../util/util.dart';

const kMainButtonTitleBaseKey = 'MainButtonTitle_';
const kMainButtonLoadingBaseKey = 'MainButtonLoading_';

class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.onTap,
    @required this.title,
    this.loading = false,
    this.disabled = false,
    this.maxWidth = double.infinity,
    this.color = AppStyles.darkBackground,
    this.textColor = Colors.white,
  }) : super(key: key);

  final Function onTap;
  final String title;
  final bool loading;
  final bool disabled;
  final double maxWidth;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final child = loading ? buttonLoading(context) : buttonText(context);

    return Styled.widget(
      child: child,
    )
        .constrained(minWidth: 100, maxWidth: maxWidth)
        .padding(
          vertical: context.sizeBuilder(base: 6, xs: 4),
          horizontal: context.sizeBuilder(base: 8, xs: 6),
        )
        .decorated(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(context.sizeBuilder(base: 6, xs: 4)),
          ),
        )
        .gestures(onTap: onTap);
  }

  Widget buttonText(BuildContext context) {
    return Text(title, key: Key('$kMainButtonTitleBaseKey$title'))
        .textAlignment(TextAlign.center)
        .fontSize(context.sizeBuilder(base: 14, xs: 13))
        .textColor(textColor);
  }

  Widget buttonLoading(BuildContext context) {
    return SpinKitDualRing(
      key: Key('$kMainButtonLoadingBaseKey$title'),
      color: textColor,
      size: context.sizeBuilder(base: 14, xs: 13),
    );
  }
}
