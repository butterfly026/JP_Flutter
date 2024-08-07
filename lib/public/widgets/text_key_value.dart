import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class TextKeyValue extends StatefulWidget {
  final String label;
  final String value;
  const TextKeyValue({super.key, required this.label, required this.value});
  @override
  TextKeyValueState createState() => TextKeyValueState();
}

class TextKeyValueState extends State<TextKeyValue> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: const TextStyle(
                color: AppTheme.mainDark,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.value,
              style: const TextStyle(
                color: AppTheme.mainDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
