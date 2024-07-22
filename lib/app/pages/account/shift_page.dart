
import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/calendar.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/radio_button.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:intl/intl.dart';

class UserShiftPage extends StatefulWidget {
  const UserShiftPage({super.key});

  @override
  UserShiftPageState createState() => UserShiftPageState();
}

class UserShiftPageState extends State<UserShiftPage>
    with TickerProviderStateMixin {
  final Map<String, List<dynamic>> _events = {};
  DateTime? _curSelDate = DateTime.now();
  Map<String, bool> _checkedState = {};

  @override
  void initState() {
    // int curIndex = int.tryParse(Get.parameters['index'] ?? '') ?? 0;
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }


  void onChangeTimeOption(bool bVal, String time) {
    _checkedState[time] = bVal;
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
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimens.gap_dp20,
                              right: Dimens.gap_dp20,
                              bottom: Dimens.gap_dp20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TextInfoTitle(
                                //     title: 'アカウント情報',
                                //     type: RequestInfo.SECTION_TITLE),
                                CustomCalendar(
                                  selectedDay: _curSelDate,
                                  events: _events,
                                  onChagned: (selectedDate, event) {
                                    setState(() {
                                      _curSelDate = selectedDate;
                                      if (event != null) {
                                        _checkedState = event[0];
                                      } else {
                                        _checkedState = {};
                                      }
                                    });
                                  },
                                ),
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
                                const RadioButton(
                                  options: [
                                    {'label': '繰り返さない', 'value': 0},
                                    {'label': '毎週', 'value': 1},
                                  ],
                                  isVertical: false,
                                  selectedValue: 0,
                                ),
                                CheckboxWithText(
                                  isChecked: _checkedState['8_10'] ?? false,
                                  label: '08:00~10:00',
                                  textStyle: AppTheme.body2,
                                  onChanged: (value) {
                                    onChangeTimeOption(value, '8_10');
                                  },
                                ),
                                CheckboxWithText(
                                  isChecked: _checkedState['10_12'] ?? false,
                                  label: '10:00~12:00',
                                  textStyle: AppTheme.body2,
                                  onChanged: (value) {
                                    onChangeTimeOption(value, '10_12');
                                  },
                                ),
                                CheckboxWithText(
                                  isChecked: _checkedState['12_15'] ?? false,
                                  label: '12:00~15:00',
                                  textStyle: AppTheme.body2,
                                  onChanged: (value) {
                                    onChangeTimeOption(value, '12_15');
                                  },
                                ),
                                CheckboxWithText(
                                  isChecked: _checkedState['15_18'] ?? false,
                                  label: '15:00~18:00',
                                  textStyle: AppTheme.body2,
                                  onChanged: (value) {
                                    onChangeTimeOption(value, '15_18');
                                  },
                                ),
                                CheckboxWithText(
                                  isChecked: _checkedState['18_8'] ?? false,
                                  label: '早朝深夜(18:00 ~ 8:00)',
                                  textStyle: AppTheme.body2,
                                  onChanged: (value) {
                                    onChangeTimeOption(value, '18_8');
                                  },
                                ),
                                SizedBox(height: Dimens.gap_dp10),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimens.gap_dp60),
                                        child: Button(
                                          text: "更新",
                                          onPressed: () {
                                            if (_curSelDate != null) {
                                              setState(() {
                                                _events[DateFormat('yyyy-MM-dd')
                                                    .format(_curSelDate!)] = [
                                                  _checkedState
                                                ];
                                              });
                                            }
                                          },
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
