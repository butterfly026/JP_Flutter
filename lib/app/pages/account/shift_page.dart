import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/notices/components/notice_item.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/calendar.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/input.dart';
import 'package:fpg_flutter/public/widgets/radio_button.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/top_labeled_textfield.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class UserShiftPage extends StatefulWidget {
  const UserShiftPage({super.key});

  @override
  _UserShiftPageState createState() => _UserShiftPageState();
}

class _UserShiftPageState extends State<UserShiftPage>
    with TickerProviderStateMixin {
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
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: 'シフト入力',
              ),
              Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.gap_dp20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextInfoTitle(
                                    title: 'アカウント情報',
                                    type: RequestInfo.SECTION_TITLE),
                                CustomCalendar(selectedDay: DateTime.now()),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      color: AppTheme.lightGreyBack,
                                      padding: EdgeInsets.all(Dimens.gap_dp10),
                                      child: Text('2024年3月18日',
                                          style: AppTheme.body2.copyWith(
                                              fontSize: Dimens.font_sp18,
                                              fontWeight: FontWeight.bold)),
                                    ))
                                  ],
                                ),
                                RadioButton(
                                  options: [
                                    {'label': '繰り返さない', 'value': 0},
                                    {'label': '毎週', 'value': 1},
                                    {'label': '毎月', 'value': 2},
                                  ],
                                  isVertical: false,
                                  selectedValue: 0,
                                ),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '08:00~10:00',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '10:00~12:00',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '12:00~15:00',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '15:00~18:00',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '早朝深夜(18:00 ~ 8:00)',
                                    textStyle: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp10),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimens.gap_dp60),
                                        child: Button(
                                          text: "更新",
                                          onPressed: () {},
                                          borderRadius: 16.0,
                                          backgroundColor: Colors.black,
                                          minWidth: 200.0,
                                        ))),
                                SizedBox(height: Dimens.gap_dp20)
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
