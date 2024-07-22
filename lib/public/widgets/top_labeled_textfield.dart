import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class TopLabeledTextField extends StatefulWidget {
  final String label;
  final String value;
  final String? hintText;
  final bool isPassword;
  const TopLabeledTextField(
      {super.key,
      required this.label,
      required this.value,
      this.hintText,
      this.isPassword = false});
  @override
  TopLabeledTextFieldState createState() => TopLabeledTextFieldState();
}

class TopLabeledTextFieldState extends State<TopLabeledTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimens.gap_dp10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.label, style: AppTheme.body2),
          SizedBox(height: Dimens.gap_dp10),
          TextField(
              style: AppTheme.body2,
              obscureText: widget.isPassword,
              enableSuggestions: !widget.isPassword,
              autocorrect: !widget.isPassword,
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: AppTheme.white,
                hintText: widget.hintText,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimens.gap_dp10, vertical: Dimens.gap_dp10),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.lightGreyText,
                        width: 1.0,
                        style: BorderStyle.solid)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppTheme.lightGreyText,
                        width: 1.0,
                        style: BorderStyle.solid)),
              )),
        ]));
  }
}
