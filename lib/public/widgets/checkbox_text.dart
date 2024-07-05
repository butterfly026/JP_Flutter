import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CheckboxWithText extends StatefulWidget {
  final bool isChecked;
  final String label;
  final TextStyle textStyle;
  final ValueChanged<bool>? onChanged;

  const CheckboxWithText(
      {Key? key,
      required this.isChecked,
      required this.label,
      this.onChanged,
      required this.textStyle})
      : super(key: key);

  @override
  _CheckboxWithTextState createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<CheckboxWithText> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(-Dimens.gap_dp10, 0.0), // Adjust this offset as needed
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              Checkbox(
                value: _isChecked,
                activeColor: AppTheme.black,
                visualDensity: VisualDensity(horizontal: -Dimens.gap_dp5, vertical: -Dimens.gap_dp6),
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                    widget.onChanged!(_isChecked);
                  });
                },
              ),
              Flexible(
                  child: Text(
                widget.label,
                style: widget.textStyle,
              ))
            ],
          )
        ]));
  }
}
