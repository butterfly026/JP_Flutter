import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class RadioButton extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final TextStyle? textStyle;
  const RadioButton({Key? key, required this.options, this.textStyle})
      : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return ListTile(
          visualDensity:
              VisualDensity(horizontal: -Dimens.gap_dp2, vertical: -Dimens.gap_dp6),
          horizontalTitleGap: Dimens.gap_dp2,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          title:
              Text(option['label'], style: widget.textStyle ?? AppTheme.body2),
          leading: Radio<int>(
            visualDensity: VisualDensity(
                horizontal: -Dimens.gap_dp6, vertical: -Dimens.gap_dp6),
            value: option['value'],
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
