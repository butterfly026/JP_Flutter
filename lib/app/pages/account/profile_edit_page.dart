import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/notices/components/notice_item.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/dropdown.dart';
import 'package:fpg_flutter/public/widgets/mini_textfield.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/top_labeled_textfield.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage>
    with TickerProviderStateMixin {
  final List<String> japaneseMonths = [
    '1月',
    '2月',
    '3月',
    '4月',
    '5月',
    '6月',
    '7月',
    '8月',
    '9月',
    '10月',
    '11月',
    '12月'
  ];
  final List<String> weekDays = [
    '日曜日',
    '月曜日',
    '火曜日',
    '水曜日',
    '木曜日',
    '金曜日',
    '土曜日'
  ];
  @override
  void initState() {
    // int curIndex = int.tryParse(Get.parameters['index'] ?? '') ?? 0;
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width3_2 = MediaQuery.of(context).size.width / 3 * 2;
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: '個人情報編集',
              ),
              Divider(
                height: 1,
                color: AppTheme.black,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.gap_dp20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextInfoTitle(
                                    title: '基本情報',
                                    type: RequestInfo.SECTION_TITLE),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('氏名', style: AppTheme.body2),
                                Row(children: [
                                  Expanded(
                                    child:
                                        MiniTextField(hintText: '氏', value: ''),
                                  ),
                                  SizedBox(width: Dimens.gap_dp10),
                                  Expanded(
                                    child:
                                        MiniTextField(hintText: '名', value: ''),
                                  ),
                                ]),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('氏名(カタカナ)', style: AppTheme.body2),
                                Row(children: [
                                  Expanded(
                                    child:
                                        MiniTextField(hintText: '氏', value: ''),
                                  ),
                                  SizedBox(width: Dimens.gap_dp10),
                                  Expanded(
                                    child:
                                        MiniTextField(hintText: '名', value: ''),
                                  ),
                                ]),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('性別', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                CustomDropdownMenu(
                                  items: [
                                    '男',
                                    '女',
                                  ],
                                  selectedItem: null,
                                  height: Dimens.gap_dp50,
                                  width: width3_2,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('生年月日', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '年', value: '')),
                                        SizedBox(width: Dimens.gap_dp10),
                                        Expanded(
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: Dimens.gap_dp10),
                                                child: CustomDropdownMenu(
                                                  items: japaneseMonths,
                                                  selectedItem: null,
                                                  height: Dimens.gap_dp50,
                                                  width: width3_2 / 3,
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                ))),
                                        SizedBox(
                                            width: Dimens
                                                .gap_dp10), // Optional: Adds space between components
                                        Expanded(
                                          child: MiniTextField(
                                              hintText: '日', value: ''),
                                        ),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('電話番号', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '年', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp24),
                                Text('住所', style: AppTheme.body2),
                                Row(
                                  children: [
                                    Expanded(
                                        child: MiniTextField(
                                            hintText: '郵便番号', value: '')),
                                    SizedBox(width: Dimens.gap_dp10),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: Dimens.gap_dp10),
                                            child: CustomDropdownMenu(
                                              items: japaneseMonths,
                                              selectedItem: null,
                                              height: Dimens.gap_dp50,
                                              width: width3_2 * 3 / 2,
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ))),
                                  ],
                                ),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('市町村・番地', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('建物名・部屋番号など', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp50),
                                Text('アシスタメンバー情報', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '建物名・部屋番号など',
                                                value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '学生or社会人', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '交通手段', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '可動範囲（分）', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '最寄り駅', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '可動範囲（何駅）', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: 'OKな依頼', value: '')),
                                      ],
                                    )),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: 'NGな依頼　選択', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp50),
                                Text('稼働可能な曜日', style: AppTheme.body2),
                                for (var item in weekDays)
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item, style: AppTheme.body2),
                                        SizedBox(height: Dimens.gap_dp8),
                                        CustomDropdownMenu(
                                          items: [
                                            '',
                                          ],
                                          selectedItem: null,
                                          height: Dimens.gap_dp50,
                                          width: width3_2,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ]),
                                SizedBox(height: Dimens.gap_dp50),
                                Text('口座情報', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '銀行名', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp8),
                                Text('支店番号', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                CustomDropdownMenu(
                                  items: [
                                    '',
                                  ],
                                  selectedItem: null,
                                  height: Dimens.gap_dp50,
                                  width: width3_2,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '口座種別', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp8),
                                Container(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '口座番号', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp50),
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimens.gap_dp60, right: Dimens.gap_dp60),
                                    child: Button(
                                      text: "便新",
                                      onPressed: () {},
                                      backgroundColor: AppTheme.black,
                                      borderRadius: Dimens.gap_dp20,
                                    ),
                                  ),
                                ),
                              ]))))
            ],
          )
        ]));
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
