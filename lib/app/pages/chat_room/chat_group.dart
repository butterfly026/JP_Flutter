import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/notices/components/notice_item.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class ChatGroupPage extends StatefulWidget {
  const ChatGroupPage({super.key});

  @override
  _ChatGroupPageState createState() => _ChatGroupPageState();
}

class _ChatGroupPageState extends State<ChatGroupPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
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
                color: AppTheme.black,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(Dimens.gap_dp20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TableCellSettings(
                                    title: '2024年4月4日_テスト_病院付き添い',
                                    onTap: () {
                                      Get.toNamed(AppRouter.chatMessage, parameters: {'title': '2024年4月4日_テスト_病院付き添い'});
                                    }),
                                TableCellSettings(
                                    title: "2024年3月14日_テスト_病院付き添い",
                                    onTap: () {
                                      Get.toNamed(AppRouter.chatMessage, parameters: {'title': '2024年3月14日_テスト_病院付き添い'});
                                    }),
                              ]))))
            ],
          )
        ]));
  }
}
