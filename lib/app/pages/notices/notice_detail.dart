import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/notices/components/notice_item.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class NoticeDetailPage extends StatefulWidget {
  const NoticeDetailPage({super.key});

  @override
  _NoticeDetailPageState createState() => _NoticeDetailPageState();
}

class _NoticeDetailPageState extends State<NoticeDetailPage>
    with TickerProviderStateMixin {
  List<Notice> notices = Notice.notices;
  Notice? notice;

  @override
  void initState() {
    int curIndex = int.tryParse(Get.parameters['index'] ?? '') ?? 0;
    notice = notices[curIndex];
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
                titleText: 'お知らせ詳細',
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
                                Text(
                                  notice?.regDate ?? '',
                                  style: AppTheme.body2.copyWith(
                                      fontSize: Dimens.font_sp14,
                                      color: AppTheme.lightGreyText),
                                ),
                                SizedBox(height: Dimens.gap_dp20),
                                Text(
                                  notice?.title ?? '',
                                  style: AppTheme.body2.copyWith(
                                      color: AppTheme.lightGreyText,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: Dimens.gap_dp20),
                                Text(
                                  notice?.content ?? '',
                                  style: AppTheme.body2
                                      .copyWith(color: AppTheme.lightGreyText),
                                ),
                              ]))))
            ],
          )
        ]));
  }
}

