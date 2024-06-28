import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGeneralBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final Color? backgroundColor;
  final List<Widget>? actionWidgets;
  final Widget? leading;
  final bool? centerTitle;

  const AppGeneralBar({
    super.key,
    this.backgroundColor,
    this.titleWidget,
    this.actionWidgets,
    this.centerTitle,
    this.leading
  });

  @override
  Size get preferredSize => Size(double.infinity, 50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xff609AC5),
      leading: leading,
      title: titleWidget,
      actions: actionWidgets,
      centerTitle: centerTitle,
      
    );
  }
}
