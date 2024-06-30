import 'package:flutter/material.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String?> onChanged;

  const CustomDropdownMenu({
    Key? key,
    required this.items,
    this.selectedItem = 'すべて',
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final TextEditingController dropdownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.selectedItem,
      controller: dropdownController,
      // inputDecorationTheme: InputDecorationTheme(
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(
      //         color: AppTheme
      //             .mainLightGrey, // Set the border color of the dropdown button
      //         width: 2.0,
      //       ),
      //     ),
      //     fillColor: Colors.white,
      //     filled: true),
      // requestFocusOnTap is enabled/disabled by platforms when it is null.
      // On mobile platforms, this is false by default. Setting this to true will
      // trigger focus request on the text field and virtual keyboard will appear
      // afterward. On desktop platforms however, this defaults to true.
      requestFocusOnTap: true,
      // label: const Text('Color'),
      onSelected: (String? newValue) {
        // setState(() {
        //   _selectedItem = newValue;
        // });
        widget.onChanged(newValue);
      },
      width: 200,
      dropdownMenuEntries:
          widget.items.map<DropdownMenuEntry<String>>((String item) {
        return DropdownMenuEntry<String>(
            value: item,
            label: item,
            labelWidget: Text(item, style: AppTheme.body2),
            leadingIcon:
                Icon(Icons.double_arrow, color: AppTheme.mainDark, size: 10.0),
            // enabled: color.label != 'Grey',
            style: MenuItemButton.styleFrom(
              foregroundColor: AppTheme.mainLightGrey,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: AppTheme.mainLightGrey,
                      style: BorderStyle.solid,
                      width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
            ));
      }).toList(),
      // menuBui
    );
  }
}
