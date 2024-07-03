import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/config/images.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/image.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/text_subtitle_value.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestConfirmedDetailPage extends StatefulWidget {
  const RequestConfirmedDetailPage({super.key, this.selectedData});
  final RequestListData? selectedData;

  @override
  _RequestConfirmedDetailPageState createState() =>
      _RequestConfirmedDetailPageState();
}

class _RequestConfirmedDetailPageState extends State<RequestConfirmedDetailPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late RequestDetailController _controller;
  RequestListData? selectedData;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
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
                                    margin: EdgeInsets.only(
                                        bottom: Dimens.gap_dp30),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.success,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        selectedData!.status,
                                        textAlign: TextAlign.center,
                                        style: AppTheme.titleRegular
                                            .copyWith(color: AppTheme.success),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TextInfoTitle(
                                  title: '【依頼内容】',
                                  type: RequestInfo.SECTION_TITLE),
                              Padding(
                                  padding: EdgeInsets.all(Dimens.gap_dp10),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextSubitleValue(
                                            title: '■住所',
                                            value: '〒777-2222　秋田県秋田市1111-3'),
                                        TextSubitleValue(
                                          title: '■依頼日時',
                                          value: '2024-03-03  14:00 ~ 15:00',
                                        ),
                                        TextSubitleValue(
                                            title: '■依頼内容', value: '病院付き添い'),
                                        TextSubitleValue(
                                            title: '■依頼内容詳細', value: ''),
                                        SizedBox(height: Dimens.gap_dp200),
                                        TextSubitleValue(
                                            title: '■運営からのコメント', value: ''),
                                        SizedBox(height: Dimens.gap_dp200),
                                      ])),
                              Divider(
                                height: 1,
                                color: AppTheme.mainLightGrey,
                              ),
                              SizedBox(height: Dimens.gap_dp10),
                              Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextInfoTitle(
                                        title: '【依頼者情報】',
                                        type: RequestInfo.SECTION_TITLE),
                                    Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.gap_dp10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextSubitleValue(
                                                  title: '■依頼者氏名',
                                                  value: '山田太郎'),
                                              TextSubitleValue(
                                                title: '■依頼者性別',
                                                value: '男性',
                                              ),
                                              TextSubitleValue(
                                                  title: '■身体的特徴', value: ''),
                                              SizedBox(
                                                  height: Dimens.gap_dp200),
                                              TextSubitleValue(
                                                  title: '■精神的特徴', value: ''),
                                              SizedBox(
                                                  height: Dimens.gap_dp200),
                                            ])),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.mainLightGrey,
                              ),
                              SizedBox(height: Dimens.gap_dp10),
                              Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextInfoTitle(
                                        title: '【緊急時連絡先】',
                                        type: RequestInfo.SECTION_TITLE),
                                    Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.gap_dp10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Dimens.gap_dp20),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text('運営',
                                                          style: AppTheme
                                                              .subtitle))),
                                              TextSubitleValue(
                                                  title: '■担当者', value: '秋田太郎'),
                                              TextSubitleValue(
                                                title: '■連絡先',
                                                value: '080-1111-2222',
                                              ),
                                            ])),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.mainLightGrey,
                              ),
                              SizedBox(height: Dimens.gap_dp10),
                              Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.gap_dp10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Dimens.gap_dp20),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text('担当ケアマネ',
                                                          style: AppTheme
                                                              .subtitle))),
                                              TextSubitleValue(
                                                  title: '■所属居宅事業所',
                                                  value: '秋田事業所'),
                                              TextSubitleValue(
                                                title: '■氏名',
                                                value: '秋田太郎',
                                              ),
                                              TextSubitleValue(
                                                title: '■連絡先',
                                                value: '080-1111-2222',
                                              ),
                                              SizedBox(
                                                  height: Dimens.gap_dp100),
                                            ])),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.mainLightGrey,
                              ),
                              SizedBox(height: Dimens.gap_dp10),
                              Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextInfoTitle(
                                        title: '【過去の依頼内容】',
                                        type: RequestInfo.SECTION_TITLE),
                                    Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.gap_dp10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextSubitleValue(
                                                  title: '■依頼日',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■依頼内容',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■稼働内容詳細',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■前担当が感じた人柄',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              SizedBox(
                                                  height: Dimens.gap_dp100),
                                            ])),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.mainLightGrey,
                              ),
                              SizedBox(height: Dimens.gap_dp10),
                              Padding(
                                padding: EdgeInsets.all(Dimens.gap_dp20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.gap_dp10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextSubitleValue(
                                                  title: '■依頼日',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■依頼内容',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■稼働内容詳細',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              TextSubitleValue(
                                                  title: '■前担当が感じた人柄',
                                                  value: '',
                                                  marginBottom:
                                                      Dimens.gap_dp10),
                                              SizedBox(
                                                  height: Dimens.gap_dp100),
                                            ])),
                                  ],
                                ),
                              ),
                            ],
                          )))),
              Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              SizedBox(height: Dimens.gap_dp10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Button(
                  text: "報告",
                  onPressed: () {
                    selectedData?.status = '依頼確定';
                  },
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.primary,
                  textColor: AppTheme.black,
                ),
                Button(
                  text: "チャット",
                  onPressed: () {},
                  borderRadius: Dimens.gap_dp16,
                  paddingVertical: Dimens.gap_dp16,
                  paddingHorizontal: Dimens.gap_dp28,
                  minWidth: Dimens.gap_dp100 * 1.6,
                  backgroundColor: AppTheme.buttonDisabledBack,
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
