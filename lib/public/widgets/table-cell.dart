import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';


class TableCellSettings extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  TableCellSettings({this.title = '', this.onTap = _defaultOnTap});

  static void _defaultOnTap() {
    // Function body
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTheme.body2),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppTheme.mainDark, size: 14),
            )
          ],
        ),
      ),
    );
  }
}