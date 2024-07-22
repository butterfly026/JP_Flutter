import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:get/get.dart';

import 'bottom_tab.dart';
import 'bottom_tab_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.tabs,
    this.onTap,
  });

  final List<BottomTabModel>? tabs;
  final Function(int)? onTap;

  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<BottomTabModel> get _tabs => widget.tabs ?? [];

  late MainHomeController controller;

  Color backgroundColor = Colors.white.withOpacity(0.75);

  @override
  void initState() {
    super.initState();
    controller = MainHomeController.to;
    ever(
      controller.currentTabIndex,
      (callback) {
        if (mounted) {
          setState(() {});
        }
      },
    );
    ever(controller.bottomNavs, (callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = Colors.white.withOpacity(0.75);
    return Container(
      height: Dimens.gap_dp60,
      color: backgroundColor,
      child: Row(
        children: _tabs.map((data) => _buildTab(data)).toList(),
      ),
    );
  }

  Widget _buildTab(BottomTabModel tabData) {
    return Expanded(
      child: BottomTab(
        data: tabData,
        encrypted: true,
        selected: controller.currentTabIndex.value == _tabs.indexOf(tabData),
        onTap: (value) {
          final int newIndex = _tabs.indexOf(value);
          if (null != widget.onTap) {
            widget.onTap!.call(newIndex);
          }
        },
      ),
    );
  }
}
