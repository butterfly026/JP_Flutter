import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CheckboxWithText extends StatefulWidget {
  final bool isChecked;
  final String label;
  final TextStyle textStyle;

  const CheckboxWithText({
    Key? key,
    required this.isChecked,
    required this.label,
    required this.textStyle
  }) : super(key: key);

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(
          widget.label,
          style: widget.textStyle,
        ),
      ],
    );
  }
}
