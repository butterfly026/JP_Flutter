import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<dynamic> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final String? valueFieldName;
  final String? labelFieldName;
  final double? height;
  final double? width;
  final double? borderRadius;

  const CustomDropdownMenu({
    Key? key,
    required this.items,
    this.selectedItem,
    this.height,
    this.width,
    this.borderRadius,
    this.labelFieldName,
    this.valueFieldName,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final TextEditingController dropdownController = TextEditingController();
  String? _selectedItem;
  String? valueFieldName;
  String? labelFieldName;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
    valueFieldName = widget.valueFieldName;
    labelFieldName = widget.labelFieldName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width / 2, // Half of the screen width
      height: widget.height ?? Dimens.gap_dp70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? Dimens.gap_dp12), // Rounded corners
        border: Border.all(
          color: Colors.grey, // Border color
          width: Dimens.gap_dp1, // Border width
        ),
      ),
      child: DropdownButton<dynamic>(
        value: _selectedItem,
        dropdownColor: AppTheme.white,
        items: widget.items.map((dynamic item) {
          return DropdownMenuItem<dynamic>(
            value: item is String ? item : item[valueFieldName],
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimens.gap_dp10, vertical: Dimens.gap_dp10),
              child: Text(item is String ? item : item[labelFieldName], style: TextStyle(fontSize: Dimens.font_sp20)),
            ),
          );
        }).toList(),
        onChanged: (dynamic? newValue) {
          setState(() {
            _selectedItem = newValue;
            widget.onChanged(newValue);
          });
        },
        isExpanded:
            true, // Make the dropdown take the full width of the container
        underline: Container(), // Remove the underline
      ),
    );
  }
}
