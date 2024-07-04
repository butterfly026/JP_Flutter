import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class LabeledRichText extends StatefulWidget {
  final String label;
  final String value;
  final ValueChanged<String>? onChanged;

  const LabeledRichText({
    Key? key,
    required this.label,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _LabeledRichTextState createState() => _LabeledRichTextState();
}

class _LabeledRichTextState extends State<LabeledRichText> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if(widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTheme.body2,
          ),
          SizedBox(height: Dimens.gap_dp10),
          Center(
            child: SizedBox(
              height: Dimens.gap_dp150,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.light_grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}