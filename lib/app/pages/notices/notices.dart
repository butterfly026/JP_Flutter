import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({super.key});

  @override
  NoticesPageState createState() => NoticesPageState();
}

class NoticesPageState extends State<NoticesPage>
    with TickerProviderStateMixin {
  List<Notice> notices = Notice.notices;
  String? selected = 'すべて';

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              SubPageAppBar(
                titleText: 'おしらせ',
              ),
              const Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Expanded(
                child: Container(
                  color: AppTheme.white,
                  child: ListView.builder(
                    itemCount: notices.length,
                    padding: EdgeInsets.only(
                        top: Dimens.gap_dp10, right: Dimens.gap_dp8),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {

                      return Container(
                          padding: EdgeInsets.all(Dimens.gap_dp16),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                              width: Dimens.gap_dp1,
                              color: AppTheme.black,
                              style: BorderStyle.solid,
                            )),
                          ),
                          child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Get.toNamed(AppRouter.noticeDetail,
                                    parameters: {'index': index.toString()});
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notices[index].regDate,
                                          style: AppTheme.body2.copyWith(
                                              fontSize: Dimens.font_sp14,
                                              color: AppTheme.lightGreyText),
                                        ),
                                        SizedBox(height: Dimens.gap_dp20),
                                        Text(
                                          notices[index].title,
                                          style: AppTheme.body2.copyWith(
                                              color: AppTheme.lightGreyText),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppTheme.mainDark,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              )));
                    },
                  ),
                ),
              ),
            ],
          )
        ]));
  }
}
