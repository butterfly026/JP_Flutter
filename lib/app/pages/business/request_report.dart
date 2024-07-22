import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/text_key_value.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestReportPage extends StatefulWidget {
  const RequestReportPage({super.key});

  @override
  RequestReportPageState createState() => RequestReportPageState();
}

class RequestReportPageState extends State<RequestReportPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  RequestListData? selectedData;
  bool startDisabled = true, activeDisabled = true;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    selectedData = RequestListData.fromJson(
        jsonDecode(Get.parameters['request_info'] ?? '{}'));
    startDisabled = true;
    activeDisabled = true;
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
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimens.gap_dp10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                            child: const TextKeyValue(
                                label: '出発時刻', value: '2024-03-03  13:40 ')),
                        Padding(
                            padding: EdgeInsets.only(
                                top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                            child: const TextKeyValue(
                                label: '開始時刻', value: '2024-03-03  14:20 ')),
                        Padding(
                            padding: EdgeInsets.only(
                                top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                            child: const TextKeyValue(
                                label: '延長終了①', value: '2024-03-03  15:15')),
                        Padding(
                            padding: EdgeInsets.only(
                                top: Dimens.gap_dp40, left: Dimens.gap_dp20),
                            child: const TextKeyValue(
                                label: '延長終了②', value: '2024-03-03  15:30')),
                        Padding(
                            padding: EdgeInsets.only(
                                top: Dimens.gap_dp40,
                                bottom: Dimens.gap_dp40,
                                left: Dimens.gap_dp20),
                            child: const TextKeyValue(
                                label: '終了時刻', value: '2024-03-03  15:00 ')),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: AppTheme.mainLightGrey,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: Dimens.gap_dp40,
                          left: Dimens.gap_dp80,
                          right: Dimens.gap_dp80),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Button(
                                  text: "出発報告",
                                  onPressed: () {
                                    setState(() {
                                      startDisabled = false;
                                    });
                                  },
                                  isFullToWidth: true,
                                  borderRadius: Dimens.gap_dp16,
                                  backgroundColor: AppTheme.black,
                                  minWidth: Dimens.gap_dp200,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: Dimens.gap_dp40),
                          Row(
                            children: [
                              Expanded(
                                  child: Button(
                                text: "開始報告",
                                onPressed: () {
                                  Get.toNamed(AppRouter.requestStart, parameters:{'isExtension': '0'});
                                  setState(() {
                                    activeDisabled = false;
                                  });
                                },
                                borderRadius: Dimens.gap_dp16,
                                backgroundColor: AppTheme.black,
                                minWidth: Dimens.gap_dp200,
                                disabled: startDisabled,
                                isFullToWidth: true,
                              ))
                            ],
                          ),
                          SizedBox(height: Dimens.gap_dp40),
                          Row(
                            children: [
                              Expanded(
                                  child: Button(
                                text: "延長報告",
                                onPressed: () {
                                  Get.toNamed(AppRouter.requestStart, parameters:{'isExtension': '1'});
                                },
                                borderRadius: Dimens.gap_dp16,
                                backgroundColor: AppTheme.black,
                                minWidth: Dimens.gap_dp200,
                                disabled: activeDisabled,
                                isFullToWidth: true,
                              ))
                            ],
                          ),
                          SizedBox(height: Dimens.gap_dp40),
                          Row(
                            children: [
                              Expanded(
                                  child: Button(
                                text: "活動報告",
                                onPressed: () {
                                  Get.toNamed(AppRouter.requestActive);
                                },
                                borderRadius: Dimens.gap_dp16,
                                backgroundColor: AppTheme.black,
                                minWidth: Dimens.gap_dp200,
                                disabled: activeDisabled,
                                isFullToWidth: true,
                              ))
                            ],
                          ),
                          SizedBox(height: Dimens.gap_dp40),
                        ],
                      ))
                ],
              ))),
            ],
          )
        ]));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
