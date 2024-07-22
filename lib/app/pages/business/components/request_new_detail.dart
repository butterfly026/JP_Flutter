import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/text_subtitle_value.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestNewDetailPage extends StatefulWidget {
  const RequestNewDetailPage({super.key, this.selectedData});
  final RequestListData? selectedData;

  @override
  RequestNewDetailPageState createState() => RequestNewDetailPageState();
}

class RequestNewDetailPageState extends State<RequestNewDetailPage>
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
    selectedData = widget.selectedData;
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
    return GetBuilder<RequestDetailController>(
        init: _controller,
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: EdgeInsets.all(Dimens.gap_dp20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimens.gap_dp30,
                            vertical: Dimens.gap_dp2,
                          ),
                          margin: EdgeInsets.only(bottom: Dimens.gap_dp30),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: AppTheme.info,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              selectedData!.status,
                              textAlign: TextAlign.center,
                              style: AppTheme.titleRegular
                                  .copyWith(color: AppTheme.info),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const TextSubitleValue(title: '■性別', value: '男性'),
                    const TextSubitleValue(
                      title: '■住所',
                      value: '〒777-2222　秋田県秋田市1111-3',
                    ),
                    const TextSubitleValue(title: '■依頼内容', value: '病院付き添い'),
                    const TextSubitleValue(title: '■所要時間', value: '1h'),
                    const TextSubitleValue(title: '■身体的特徴', value: ''),
                    SizedBox(height: Dimens.gap_dp100),
                    const TextSubitleValue(title: '■精神的特徴', value: ''),
                    SizedBox(height: Dimens.gap_dp100),
                    const TextSubitleValue(title: '■運営からのコメント', value: ''),
                    SizedBox(height: Dimens.gap_dp100),
                    SizedBox(height: Dimens.gap_dp100),
                    Container(
                      margin: EdgeInsets.only(bottom: Dimens.gap_dp6),
                      child: const TextInfoTitle(
                        title: '■候補日',
                        type: RequestInfo.SUB_TITLE,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: Dimens.gap_dp30),
                        child: CheckboxWithText(
                            isChecked: false,
                            label: '2024-03-03  14:00 ~ 15:00',
                            textStyle: AppTheme.body2)),
                    Padding(
                        padding: EdgeInsets.only(left: Dimens.gap_dp30),
                        child: CheckboxWithText(
                            isChecked: false,
                            label: '2024-03-03  14:00 ~ 15:00',
                            textStyle: AppTheme.body2)),
                    Padding(
                        padding: EdgeInsets.only(left: Dimens.gap_dp30),
                        child: CheckboxWithText(
                            isChecked: false,
                            label: '2024-03-03  14:00 ~ 15:00',
                            textStyle: AppTheme.body2)),
                  ],
                ),
              ))),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              SizedBox(height: Dimens.gap_dp10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Button(
                  text: "依頼拒否",
                  onPressed: () {
                    selectedData?.status = '依頼確定';
                    Get.toNamed(AppRouter.requestDetail, parameters: {
                      'request_info': jsonEncode(selectedData?.toJson())
                    });
                  },
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.error,
                  textColor: AppTheme.black,
                ),
                Button(
                  text: "依頼応募",
                  onPressed: () {},
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.warning,
                  textColor: AppTheme.black,
                )
              ]),
              SizedBox(height: Dimens.gap_dp20),
            ],
          );
        });
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
