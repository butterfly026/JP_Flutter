import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/components/request_item_view.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/dropdown.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestListPage extends StatefulWidget {
  const RequestListPage({super.key});

  @override
  RequestListPageState createState() => RequestListPageState();
}

class RequestListPageState extends State<RequestListPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<RequestListData> requestList = RequestListData.requestList;
  List<RequestListData> filteredList = [];
  String? selected = 'すべて';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    filteredList = requestList;
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppTheme.white,
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimens.gap_dp20,
              left: Dimens.gap_dp20,
              right: Dimens.gap_dp10),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimens.gap_dp16, bottom: Dimens.gap_dp14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomDropdownMenu(
                      items: const [
                        'すべて',
                        '依頼募集中',
                        '申請中',
                        '依頼確定',
                        '開始済み',
                        '延長中',
                        '依頼拒否',
                        '活動報告済み',
                        '募集終了',
                        'キャンセル',
                      ],
                      selectedItem: 'すべて',
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                          if (value == 'すべて') {
                            filteredList = requestList;
                          } else {
                            filteredList = requestList
                                .where((item) => item.status == value)
                                .toList();
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppTheme.white,
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      padding: EdgeInsets.only(
                          top: Dimens.gap_dp10, right: Dimens.gap_dp8),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final int count =
                            filteredList.length > 5 ? 5 : filteredList.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn)));
                        animationController?.forward();
                        return RequestItemView(
                          onPressItem: () {
                            if (filteredList[index].status != '活動報告済み') {
                              Get.toNamed(AppRouter.requestDetail, parameters: {
                                'request_info':
                                    jsonEncode(filteredList[index].toJson())
                              });
                            }
                          },
                          onPressReport: () {
                            Get.toNamed(AppRouter.requestReport, parameters: {
                              'request_info':
                                  jsonEncode(filteredList[index].toJson())
                            });
                          },
                          requestData: filteredList[index],
                          animation: animation,
                          animationController: animationController!,
                        );
                      },
                    ),
                  ),
                  // ),
                )
              ],
            ),
          ),
        ));
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
