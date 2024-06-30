import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class LabeledRichText extends StatefulWidget {
  final String label;
  final String value;
  const LabeledRichText({super.key, required this.label, required this.value});
  @override
  _LabeledRichTextState createState() => _LabeledRichTextState();
}

class _LabeledRichTextState extends State<LabeledRichText> {
  static void _defaultOnTap() {
    // Function body
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Column(children: [
              Text(
                widget.label,
                style: AppTheme.body2,
              )
            ])),
        SizedBox(height: Dimens.gap_dp10),
        Center(
          child: SizedBox(
            height: Dimens.gap_dp150, // Set the height of the input box
            child: const TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null, // Allow the text field to be multiline
              expands: true, // Expand to fill the container's height
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppTheme.light_grey, // Set the border color here
                    width: 1.0, // Set the border width
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
