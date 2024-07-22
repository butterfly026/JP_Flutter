
import 'package:customizable_datetime_picker/sources/i18n/date_picker_i18n.dart';
import 'package:customizable_datetime_picker/sources/model/date_picker_divider_theme.dart';
import 'package:customizable_datetime_picker/sources/model/date_picker_theme.dart';
import 'package:customizable_datetime_picker/sources/widget/customizable_date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/province.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/button.dart';
import 'package:fpg_flutter/public/widgets/checkbox_text.dart';
import 'package:fpg_flutter/public/widgets/dropdown.dart';
import 'package:fpg_flutter/public/widgets/mini_textfield.dart';
import 'package:fpg_flutter/public/widgets/number_formatter.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/public/widgets/top_labeled_textfield.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage>
    with TickerProviderStateMixin {
  final Map<String, String> bodies = {};
  String title = '';
  bool isNewUser = false;
  DateTime? _birthDate;

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  final TextEditingController _birthDtController = TextEditingController();
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
    if (Get.parameters['user_id'] != null) {
      isNewUser = false;
      title = '個人情報編集';
    } else {
      isNewUser = true;
      title = '個人情報登録';
    }
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  void _moveFocus() {
    if (_focusNode1.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode2);
    } else if (_focusNode2.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode3);
    }
  }

  void _selectBirthDate(BuildContext context) {
    DateTime? selectedDate =
        _birthDate ?? DateTime(DateTime.now().year - 14, 1, 1);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '生年月日',
            style: AppTheme.subtitle,
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: CustomizableDatePickerWidget(
              separatorWidget: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.gap_dp20),
                child: Text(
                  ":",
                  style: AppTheme.body2,
                ),
              ),
              locale: DateTimePickerLocale.jp,
              looping: true,
              lastDate: DateTime.now(),
              initialDate: selectedDate,
              dateFormat: "yyyy-MMMM-dd",
              pickerTheme: DateTimePickerTheme(
                  itemTextStyle: AppTheme.body2,
                  backgroundColor: Colors.white,
                  itemHeight: Dimens.gap_dp60,
                  pickerHeight: Dimens.gap_dp300,
                  dividerTheme: DatePickerDividerTheme(
                      dividerColor: const Color(0xFF00A962),
                      thickness: Dimens.gap_dp4,
                      height: Dimens.gap_dp4)),
              onChange: (dateTime, selectedIndex) {
                selectedDate = dateTime;
              }),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _birthDate = selectedDate;
                  _birthDtController.text = _birthDate == null
                      ? ''
                      : DateFormat.yMMMMd('ja_JP').format(_birthDate!);
                });
                Navigator.pop(context);
              },
              child: const Text('設定'),
            ),
          ],
        );
      },
    );
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
              const Divider(
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
                                const TextInfoTitle(
                                    title: '基本情報',
                                    type: RequestInfo.SECTION_TITLE),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('氏名', style: AppTheme.body2),
                                Row(children: [
                                  Expanded(
                                    child: MiniTextField(
                                      hintText: '姓',
                                      value: '',
                                      onChagned: (val) =>
                                          {bodies['fName'] = val},
                                    ),
                                  ),
                                  SizedBox(width: Dimens.gap_dp10),
                                  Expanded(
                                    child: MiniTextField(
                                      hintText: '名',
                                      value: '',
                                      onChagned: (val) =>
                                          {bodies['lName'] = val},
                                    ),
                                  ),
                                ]),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('氏名(カタカナ)', style: AppTheme.body2),
                                Row(children: [
                                  const Expanded(
                                    child:
                                        MiniTextField(hintText: '姓', value: ''),
                                  ),
                                  SizedBox(width: Dimens.gap_dp10),
                                  const Expanded(
                                    child:
                                        MiniTextField(hintText: '名', value: ''),
                                  ),
                                ]),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('性別', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                CustomDropdownMenu(
                                  items: const ['男', '女', 'その他'],
                                  selectedItem: null,
                                  height: Dimens.gap_dp50,
                                  width: width3_2,
                                  borderColor: AppTheme.lightGreyText,
                                  borderRadius: Dimens.gap_dp4,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('生年月日', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                          hintText: '',
                                          isReadonly: true,
                                          controller: _birthDtController,
                                          onTap: () {
                                            _selectBirthDate(context);
                                          },
                                        )),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('電話番号', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                          hintText: 'xxx',
                                          focusNode: _focusNode1,
                                          value: '',
                                          onChagned: (value) {
                                            if (value.length == 3) {
                                              _moveFocus();
                                            }
                                          },
                                          inputFormatters: [
                                            NumberFormatter(length: 3)
                                          ],
                                        )),
                                        SizedBox(width: Dimens.gap_dp10),
                                        Expanded(
                                            child: MiniTextField(
                                          hintText: 'xxxx',
                                          value: '',
                                          focusNode: _focusNode2,
                                          onChagned: (value) {
                                            if (value.length == 4) {
                                              _moveFocus();
                                            }
                                          },
                                          inputFormatters: [
                                            NumberFormatter(length: 4)
                                          ],
                                        )),
                                        SizedBox(width: Dimens.gap_dp10),
                                        Expanded(
                                            child: MiniTextField(
                                          hintText: 'xxxx',
                                          value: '',
                                          focusNode: _focusNode3,
                                          inputFormatters: [
                                            NumberFormatter(length: 4)
                                          ],
                                        )),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp24),
                                Text('住所', style: AppTheme.body2),
                                Row(
                                  children: [
                                    const Expanded(
                                        child: MiniTextField(
                                            hintText: '郵便番号', value: '')),
                                    SizedBox(width: Dimens.gap_dp10),
                                    Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: Dimens.gap_dp10),
                                            child: CustomDropdownMenu(
                                              items: Province.provinces(),
                                              labelFieldName: 'jp_name',
                                              valueFieldName: 'id',
                                              selectedItem: null,
                                              borderColor:
                                                  AppTheme.lightGreyText,
                                                  borderRadius: Dimens.gap_dp4,
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
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('建物名・部屋番号など', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: MiniTextField(
                                                hintText: '', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('学生or社会人', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                CustomDropdownMenu(
                                  items: const [
                                    '学生',
                                    '社会人',
                                  ],
                                  selectedItem: null,
                                  height: Dimens.gap_dp50,
                                  borderColor: AppTheme.lightGreyText,
                                  borderRadius: Dimens.gap_dp4,
                                  width: width3_2,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '所属大学', value: '')),
                                      ],
                                    )),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '所属学部', value: '')),
                                      ],
                                    )),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '交通手段', value: '')),
                                      ],
                                    )),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '可動範囲（分）', value: '')),
                                      ],
                                    )),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '最寄駅', value: '')),
                                      ],
                                    )),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '可動範囲（何駅）', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('やりたい依頼', style: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '1',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '2',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '3',
                                    textStyle: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp14),
                                Text('NGな依頼', style: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '1',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '2',
                                    textStyle: AppTheme.body2),
                                CheckboxWithText(
                                    isChecked: false,
                                    label: '3',
                                    textStyle: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp50),
                                Text('稼働可能な曜日', style: AppTheme.body2),
                                for (var item in weekDays)
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: Dimens.gap_dp14),
                                        Text(item, style: AppTheme.body2),
                                        SizedBox(height: Dimens.gap_dp8),
                                        CustomDropdownMenu(
                                          items: const ['午前', '午後', '終日', '不可能'],
                                          selectedItem: null,
                                          height: Dimens.gap_dp50,
                                          width: width3_2,
                                          borderColor: AppTheme.lightGreyText,
                                          borderRadius: Dimens.gap_dp4,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ]),
                                SizedBox(height: Dimens.gap_dp50),
                                Text('口座情報', style: AppTheme.body2),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
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
                                  items: const [
                                    '',
                                  ],
                                  selectedItem: null,
                                  height: Dimens.gap_dp50,
                                  width: width3_2,
                                  borderColor: AppTheme.lightGreyText,
                                  borderRadius: Dimens.gap_dp4,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
                                      children: [
                                        Expanded(
                                            child: TopLabeledTextField(
                                                label: '口座種別', value: '')),
                                      ],
                                    )),
                                SizedBox(height: Dimens.gap_dp8),
                                SizedBox(
                                    width: width3_2,
                                    child: const Row(
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
                                        left: Dimens.gap_dp60,
                                        right: Dimens.gap_dp60),
                                    child: Button(
                                      text: "更新",
                                      onPressed: saveUserInfo,
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

  void saveUserInfo() {
    Get.offAllNamed(AppRouter.profile);
  }
}
