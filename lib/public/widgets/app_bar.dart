import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

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
    super.bottom,
  }) : super(
          actions: _buildActions(actions),
          shadowColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppTheme.white),
          surfaceTintColor: Colors.transparent
        );

  @override
  Size get preferredSize => Size(double.infinity, Dimens.gap_dp70);

  static List<Widget>? _buildActions(List<Widget>? items) {
    if ((items ?? []).isEmpty) return null;
    final ws = <Widget>[];
    for (var element in items!) {
      ws.add(
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: AppTheme.margin),
          child: element,
        ),
      );
    }
    return ws;
  }
}

// ignore: must_be_immutable
class SubPageAppBar extends CustomAppBar {
  SubPageAppBar({
    super.key,
    super.automaticallyImplyLeading,
    String? titleText,
    super.toolbarHeight,
    super.actions,
    super.titleSpacing,
    Widget? leading,
    super.bottom,
  }) : super(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: Offset(
                    -Dimens.gap_dp34, 0.0), // Adjust this offset as needed
                child: Text(
                  titleText ?? '',
                  style: AppTheme.headline,
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: AppTheme.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: AppTheme.white,
            centerTitle: false);
  String? titleText;
}
