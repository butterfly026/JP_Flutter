import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/models/card/card_info.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/tools/app_tool.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final AuthController authController = Get.find();
  DateTime _focusedDay = DateTime.now();

  List<CardInfo> cards = CardInfo.cards;
  void _gotoDetailPage() {
    Get.toNamed(AppRouter.cardDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: (Padding(
          padding: EdgeInsets.all(Dimens.gap_dp20),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.gap_dp10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          // color: Colors.grey.withOpacity(0.6),
                          offset: Offset(Dimens.gap_dp4, Dimens.gap_dp4),
                          blurRadius: Dimens.gap_dp16,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.gap_dp10)),
                        child: Container(
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.chevron_left),
                                        onPressed: () {
                                          setState(() {
                                            _focusedDay = DateTime(
                                                _focusedDay.year,
                                                _focusedDay.month - 1,
                                                _focusedDay.day);
                                          });
                                        },
                                      ),
                                      Spacer(),
                                      Text(
                                        DateFormat.yMMMM('ja_JP').format(
                                            _focusedDay), // Display month and year in Japanese
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.chevron_right),
                                        onPressed: () {
                                          setState(() {
                                            _focusedDay = DateTime(
                                                _focusedDay.year,
                                                _focusedDay.month + 1,
                                                _focusedDay.day);
                                          });
                                        },
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Divider(
                                    height: 1,
                                    color: AppTheme.lightGreyBack,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimens.gap_dp20),
                                      child:
                                          Text('報酬金額', style: AppTheme.body2)),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimens.gap_dp20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '123,000',
                                            style: AppTheme.display1,
                                          ),
                                          Text(
                                            '円',
                                            style: AppTheme.body2,
                                          ),
                                          Spacer(),
                                          Column(children: [
                                            Container(
                                              padding: EdgeInsets.all(Dimens.gap_dp10),
                                              margin: EdgeInsets.only(right: Dimens.gap_dp10, bottom: Dimens.gap_dp10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppTheme
                                                          .lightGreyBack,
                                                      width: Dimens.gap_dp2),
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          Dimens.gap_dp10))),
                                              child: GestureDetector(
                                                  onTap: () {
                                                    String pdf =
                                                        "https://s29.q4cdn.com/175625835/files/doc_downloads/test.pdf";
                                                    pdf =
                                                        "https://drive.google.com/viewerng/viewer?embedded=true&url=$pdf";
                                                    AppTool.toAppWebPage(pdf);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text('明細確認',
                                                          style:
                                                              AppTheme.body2),
                                                      Icon(Icons.chevron_right,
                                                          size:
                                                              Dimens.gap_dp20),
                                                    ],
                                                  )),
                                            )
                                          ]),
                                        ],
                                      )),
                                  Divider(
                                    height: 1,
                                    color: AppTheme.lightGreyBack,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimens.gap_dp20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('振込日',
                                                    style: AppTheme.body2),
                                                Text('2024年02月10日',
                                                    style: AppTheme.body2),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: Dimens.gap_dp60,
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                          Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Dimens.gap_dp20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text('お支払先の変更',
                                                          style:
                                                              AppTheme.body2),
                                                      IconButton(
                                                        visualDensity:
                                                            VisualDensity(
                                                          vertical:
                                                              -Dimens.gap_dp2,
                                                          horizontal:
                                                              -Dimens.gap_dp5,
                                                        ),
                                                        icon: Icon(
                                                            Icons.chevron_right,
                                                            size: Dimens
                                                                .gap_dp20),
                                                        onPressed:
                                                            _gotoDetailPage,
                                                      ),
                                                    ],
                                                  ))),
                                        ],
                                      ))
                                ])))),
                Container(
                    margin: EdgeInsets.only(top: Dimens.gap_dp20),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(Dimens.gap_dp10)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          // color: Colors.grey.withOpacity(0.6),
                          offset: Offset(Dimens.gap_dp4, Dimens.gap_dp4),
                          blurRadius: Dimens.gap_dp16,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Dimens.gap_dp10)),
                        child: Container(
                            color: Colors.white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextInfoTitle(
                                      title: '【依頼一覧】',
                                      type: RequestInfo.SUB_TITLE),
                                  for (var item in cards)
                                    GestureDetector(
                                        onTap: _gotoDetailPage,
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimens.gap_dp20,
                                                vertical: Dimens.gap_dp8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item.regDate,
                                                  style: AppTheme.body2
                                                      .copyWith(
                                                          fontSize:
                                                              Dimens.font_sp14,
                                                          color: AppTheme
                                                              .lightGreyText),
                                                ),
                                                Text(
                                                  item.content,
                                                  style: AppTheme.body2
                                                      .copyWith(
                                                          fontSize:
                                                              Dimens.font_sp14,
                                                          color: AppTheme
                                                              .lightGreyText),
                                                ),
                                                Row(children: [
                                                  Text(
                                                    '${item.price}円',
                                                    style: AppTheme.body2
                                                        .copyWith(
                                                            color: AppTheme
                                                                .lightGreyText),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: Dimens.gap_dp10,
                                                        right: 8.0),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: AppTheme.mainDark,
                                                      size: 14,
                                                    ),
                                                  )
                                                ])
                                              ],
                                            )))
                                ])))),
              ]))),
            ],
          ))),
    );
  }
}
