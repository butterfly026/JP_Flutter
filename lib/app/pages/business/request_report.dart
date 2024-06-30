import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/components/request_new_detail.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/config/images.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/image.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/public/widgets/text_key_value.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestReportPage extends StatefulWidget {
  const RequestReportPage({super.key});

  @override
  _RequestReportPageState createState() => _RequestReportPageState();
}

class _RequestReportPageState extends State<RequestReportPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late RequestDetailController _controller;
  RequestListData? selectedData;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    selectedData = RequestListData.fromJson(
        jsonDecode(Get.parameters['request_info'] ?? '{}'));
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
              SubPageAppBar(titleText: '報告'),
              Divider(
                height: 1,
                color: AppTheme.dark_grey.withOpacity(0.2),
              ),
              GetBuilder<RequestDetailController>(
                  init: _controller,
                  builder: (controller) {
                    return Padding(
                      padding: EdgeInsets.all(Dimens.gap_dp10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                              child: TextKeyValue(
                                  label: '出発時刻', value: '2024-03-03  13:40 ')),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                              child: TextKeyValue(
                                  label: '開始時刻', value: '2024-03-03  14:20 ')),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: Dimens.gap_dp40,
                                  bottom: Dimens.gap_dp40,
                                  left: Dimens.gap_dp20),
                              child: TextKeyValue(
                                  label: '終了時刻', value: '2024-03-03  15:00 ')),
                        ],
                      ),
                    );
                  }),
              Divider(
                height: 1,
                color: AppTheme.dark_grey.withOpacity(0.2),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Dimens.gap_dp40,
                      left: Dimens.gap_dp80,
                      right: Dimens.gap_dp80),
                  child: Column(
                    children: [
                      Button(
                        text: "出発報告",
                        onPressed: () {},
                        borderRadius: Dimens.gap_dp16,
                        backgroundColor: AppTheme.black,
                        minWidth: Dimens.gap_dp200,
                      ),
                      SizedBox(height: Dimens.gap_dp40),
                      Button(
                        text: "開始報告",
                        onPressed: () {
                          Get.toNamed(AppRouter.requestStart);
                        },
                        borderRadius: Dimens.gap_dp16,
                        backgroundColor: AppTheme.buttonDisabledBack,
                        textColor: AppTheme.buttonDisabledText,
                        minWidth: Dimens.gap_dp200,
                        isFullToWidth: true,
                      ),
                      SizedBox(height: Dimens.gap_dp40),
                      Button(
                        text: "活動報告",
                        onPressed: () {
                          Get.toNamed(AppRouter.requestActive);
                        },
                        borderRadius: Dimens.gap_dp16,
                        backgroundColor: AppTheme.buttonDisabledBack,
                        textColor: AppTheme.buttonDisabledText,
                        minWidth: Dimens.gap_dp200,
                        isFullToWidth: true,
                      ),
                      SizedBox(height: Dimens.gap_dp40),
                    ],
                  ))
            ],
          )
        ]));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
