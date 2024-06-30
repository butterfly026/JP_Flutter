import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropdownMenu({
    Key? key,
    required this.items,
    this.selectedItem,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final TextEditingController dropdownController = TextEditingController();
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2, // Half of the screen width
      height: Dimens.gap_dp70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
        border: Border.all(
          color: Colors.grey, // Border color
          width: 2.0, // Border width
        ),
      ),
      child: DropdownButton<String>(
        value: _selectedItem,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(item, style: TextStyle(fontSize: 16.0)),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
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
