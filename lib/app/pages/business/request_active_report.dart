import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/global_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/appDefine.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/labeled_rich_text.dart';
import 'package:fpg_flutter/public/widgets/radio_button.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class RequestActiveReportPage extends StatefulWidget {
  const RequestActiveReportPage({super.key});

  @override
  RequestActiveReportPageState createState() =>
      RequestActiveReportPageState();
}

class RequestActiveReportPageState extends State<RequestActiveReportPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  final Map<String, String> bodies = {};

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
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
                titleText: '活動報告',
              ),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimens.gap_dp20,
                              vertical: Dimens.gap_dp10),
                          child: Column(
                            children: [
                              const TextInfoTitle(
                                  title: '【依頼後の自己評価】',
                                  type: RequestInfo.SECTION_TITLE),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Dimens.gap_dp20,
                                    left: Dimens.gap_dp20),
                                child: Column(children: [
                                  Column(children: [
                                    Text(
                                      '訪問マナーで出来た項目全てにチェックをしてください',
                                      style: AppTheme.body2,
                                    )
                                  ]),
                                  SizedBox(height: Dimens.gap_dp10),
                                  Row(children: [
                                    Text(
                                      '以下を確認して送信してください',
                                      style: AppTheme.body2,
                                    )
                                  ]),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label: '現場まで遅刻せずに到着出来た',
                                      textStyle: AppTheme.body2),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label: '玄関先での上着の脱ぎ方・靴の置き方を正しく行えた',
                                      textStyle: AppTheme.body2),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label: '自己紹介など明るくハキハキお話しすることが出来た',
                                      textStyle: AppTheme.body2),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label:
                                          'コミュニケーションをとる際、「傾聴」を意識して相手のお話に耳を傾け、相槌をうったり会話を弾ませることが出来た',
                                      textStyle: AppTheme.body2),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label: '作業をする際、一声かけてから動くことを実践できた',
                                      textStyle: AppTheme.body2),
                                  CheckboxWithText(
                                      isChecked: false,
                                      label:
                                          '体調や暮らしの様子を観察し、状況に応じて身体を支えたり荷物を持ったりといった気配りができた',
                                      textStyle: AppTheme.body2),
                                  SizedBox(height: Dimens.gap_dp30),
                                ]),
                              ),
                              const TextInfoTitle(
                                  title: '【活動報告】',
                                  type: RequestInfo.SECTION_TITLE),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimens.gap_dp20,
                                      left: Dimens.gap_dp20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LabeledRichText(
                                          label: '実際に稼働した内容を細かく教えてください*',
                                          value: bodies['act_operation'] ?? '',
                                          onChanged: (value) {
                                            bodies['act_operation'] = value;
                                          }),
                                      SizedBox(height: Dimens.gap_dp20),
                                      LabeledRichText(
                                          label:
                                              '今回の依頼以外に、利用者様もしくは施設担当者やケアマネージャーさんから要望はありましたか？*',
                                          value: bodies['other_request1'] ?? '',
                                          onChanged: (value) {
                                            bodies['other_request1'] = value;
                                          }),
                                      SizedBox(height: Dimens.gap_dp20),
                                      Column(children: [
                                        Text(
                                          '貴方から見た利用者様の人柄を教えてください(3つまで選択可能)',
                                          style: AppTheme.body2,
                                        )
                                      ]),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '優しい',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '謙虚',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '大人しい',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '感受性豊か',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: 'マイペース',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '心配性',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '知的',
                                          textStyle: AppTheme.body2),
                                      CheckboxWithText(
                                          isChecked: false,
                                          label: '社交的',
                                          textStyle: AppTheme.body2),
                                      SizedBox(height: Dimens.gap_dp20),
                                      LabeledRichText(
                                          label:
                                              '今回の依頼以外に、利用者様もしくは施設担当者やケアマネージャーさんから要望はありましたか？*',
                                          value: bodies['other_request2'] ?? '',
                                          onChanged: (value) {
                                            bodies['other_request2'] = value;
                                          }),
                                      SizedBox(height: Dimens.gap_dp20),
                                      Column(children: [
                                        Text(
                                          '利用者様と金品のやり取りはありましたか？(買い物などの業務以外)*',
                                          style: AppTheme.body2,
                                        )
                                      ]),
                                      const RadioButton(
                                        options: [
                                          {'label': 'はい', 'value': 1},
                                          {'label': 'いいえ', 'value': 0},
                                        ],
                                      ),
                                      SizedBox(height: Dimens.gap_dp20),
                                      Column(children: [
                                        Text(
                                          'もし次回同じ利用者様からご依頼がありましたらご対応は可能ですか？*',
                                          style: AppTheme.body2,
                                        )
                                      ]),
                                      const RadioButton(
                                        options: [
                                          {'label': 'はい', 'value': 1},
                                          {'label': 'いいえ', 'value': 0},
                                        ],
                                      ),
                                      SizedBox(height: Dimens.gap_dp20),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(children: [
                                            Text(
                                              '利用者様から物や食事をいただきましたか？*',
                                              style: AppTheme.body2,
                                            )
                                          ])),
                                      const RadioButton(
                                        options: [
                                          {'label': 'はい', 'value': 1},
                                          {'label': 'いいえ', 'value': 0},
                                        ],
                                      ),
                                      SizedBox(height: Dimens.gap_dp20),
                                      LabeledRichText(
                                          label:
                                              '利用者様からありがたくいただいた物を以下に記載してください*',
                                          value: bodies['received_users'] ?? '',
                                          onChanged: (value) {
                                            bodies['received_users'] = value;
                                          }),
                                      SizedBox(height: Dimens.gap_dp100),
                                      Button(
                                        text: "送信",
                                        onPressed: () {
                                          bool b1 = true;
                                          bodies.keys.map((key) {
                                            if (bodies[key] == null) {
                                              b1 = false;
                                            }
                                          });
                                          if (bodies.keys.length != 4 || b1 == false) {
                                            showToast('内容に不備があります。');
                                          } else {
                                            Get.back();
                                            Get.back();
                                            GlobalController.to
                                                .gotoMainPageByIndex(AppDefine
                                                    .TAB_PROFILE_INDEX);
                                          }
                                        },
                                        borderRadius: 16.0,
                                        backgroundColor: Colors.black,
                                        minWidth: 200.0,
                                      ),
                                      SizedBox(height: Dimens.gap_dp20),
                                    ],
                                  )),
                              SizedBox(height: Dimens.gap_dp10),
                            ],
                          ))))
            ],
          )
        ]));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
