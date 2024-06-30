import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class TextKeyValue extends StatelessWidget {
  final String label;
  final String value;
  const TextKeyValue({super.key, this.label = '', this.value=''});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
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
              value,
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
