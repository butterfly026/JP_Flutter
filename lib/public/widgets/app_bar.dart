import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    super.automaticallyImplyLeading,
    super.title,
    super.toolbarHeight,
    List<Widget>? actions,
    super.centerTitle,
    super.titleSpacing,
    super.leading,
    super.backgroundColor,
    super.systemOverlayStyle,
  }) : super(
          actions: _buildActions(actions),
        );

  static List<Widget>? _buildActions(List<Widget>? items) {
    if ((items ?? []).isEmpty) return null;
    final ws = <Widget>[];
    for (var element in items!) {
      ws.add(
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: AppTheme.margin),
          child: element,
        ),
      );
    }
    return ws;
  }
}
