import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/components/request_confirmed_detail.dart';
import 'package:fpg_flutter/app/pages/business/components/request_new_detail.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/config/images.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/image.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestStartReportPage extends StatefulWidget {
  const RequestStartReportPage({super.key});

  @override
  _RequestStartReportPageState createState() => _RequestStartReportPageState();
}

class _RequestStartReportPageState extends State<RequestStartReportPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late RequestDetailController _controller;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    
    _controller = RequestDetailController();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: '開始報告',                
              ),
              Expanded(
                child: GetBuilder<RequestDetailController>(
                    init: _controller,
                    builder: (controller) {
                      return Padding(
                        padding: EdgeInsets.all(Dimens.gap_dp10),
                        child: Column(
                          children: <Widget>[],
                        ),
                      );
                    }),
              ),
            ],
          )
        ]));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
