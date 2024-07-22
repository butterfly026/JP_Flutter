import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/dropdown.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class RequestStartReportPage extends StatefulWidget {
  const RequestStartReportPage({super.key});

  @override
  RequestStartReportPageState createState() => RequestStartReportPageState();
}

class RequestStartReportPageState extends State<RequestStartReportPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool isExtension = false;
  bool isChecked = false;
  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    isExtension = (Get.parameters['isExtension'] ?? '0') == '1';
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
                titleText: isExtension ? '延長報告' : '開始報告',
              ),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.gap_dp30, vertical: Dimens.gap_dp10),
                  child: Column(
                    children: [
                      Row(children: [
                        Text(
                          isExtension
                              ? '延長したい時間を選択してください'
                              : '以下の日時で開始報告を送信します。',
                          style: AppTheme.body2,
                        )
                      ]),
                      if (isExtension)
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: Dimens.gap_dp30),
                              CustomDropdownMenu(
                                items: const [
                                  '15分',
                                  '30分',
                                  '45分',
                                  '60分',
                                ],
                                height: Dimens.gap_dp50,
                                borderRadius: 0,
                                selectedItem: null,
                                onChanged: (val) {},
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: Dimens.gap_dp30),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimens.gap_dp20,
                              vertical: Dimens.gap_dp30),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: AppTheme.light_grey,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimens.gap_dp20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isExtension
                                    ? '延長終了時間：2024-03-03  15:15'
                                    : '送信日時：2024-03-03  14:00',
                                style: AppTheme.display1
                                    .copyWith(fontSize: Dimens.font_sp28),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              )
                            ],
                          )),
                      SizedBox(height: Dimens.gap_dp80),
                      Row(children: [
                        Text(
                          '以下を確認して送信してください',
                          style: AppTheme.body2,
                        )
                      ]),
                      SizedBox(height: Dimens.gap_dp10),
                      CheckboxWithText(
                          isChecked: false,
                          label: '高齢者に確認しましたか？',
                          onChanged: (val) => {
                            isChecked = val
                          },
                          textStyle: AppTheme.body2
                              .copyWith(fontWeight: FontWeight.bold))
                    ],
                  )),
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.gap_dp60),
                            child: Button(
                              text: "送信",
                              onPressed: () {
                                if(!isChecked) {
                                  showToast('チェックしてください');
                                } else {
                                  Get.back();
                                }
                              },
                              borderRadius: 16.0,
                              backgroundColor: Colors.black,
                              minWidth: 200.0,
                            ))),
                    SizedBox(height: Dimens.gap_dp50)
                  ],
                ),
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
