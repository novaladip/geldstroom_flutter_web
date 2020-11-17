import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constant/app_styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    this.validator,
    @required this.labelText,
    this.enabled = true,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.unspecified,
    this.onFieldSubmitted,
    this.controller,
    this.marginVertical = 8,
    this.obscureText = false,
    this.onSaved,
    this.errorText,
    this.helperText,
    this.onTap,
    this.initialValue,
    this.onChanged,
    this.borderRadius = 5,
    this.inputFormatters = const [],
  }) : super(key: key);

  final String Function(String) validator;
  final void Function() onFieldSubmitted;
  final String labelText;
  final bool enabled;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final double marginVertical;
  final bool obscureText;
  final String errorText;
  final Function(String) onSaved;
  final String helperText;
  final void Function() onTap;
  final String initialValue;
  final Function(String) onChanged;
  final double borderRadius;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    final inputDecoration = InputDecoration(
      focusColor: color,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.8,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      filled: true,
      labelText: labelText,
      enabled: enabled,
      errorText: errorText,
      helperText: helperText,
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: marginVertical),
      child: TextFormField(
        autocorrect: false,
        initialValue: initialValue,
        style: TextStyle(color: Colors.white),
        enabled: enabled,
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        onSaved: onSaved,
        focusNode: focusNode,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        keyboardAppearance: Brightness.dark,
        onChanged: onChanged,
        onFieldSubmitted: (_) => onFieldSubmitted(),
        inputFormatters: inputFormatters,
        decoration: inputDecoration,
        cursorColor: AppStyles.primaryColor,
      ),
    );
  }
}
