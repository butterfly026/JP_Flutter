import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/notices/components/notice_item.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/models/notice.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/chat_input_widget.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class ChatMessagePage extends StatefulWidget {
  const ChatMessagePage({super.key});

  @override
  _ChatMessagePageState createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage>
    with TickerProviderStateMixin {
      String title = '';
  @override
  void initState() {
    title = Get.parameters['title'] ?? '';
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
                titleText: title,
              ),
              Divider(
                height: 1,
                color: AppTheme.mainLightGrey,
              ),
              Spacer(),
              
                                ChatInputWidget(),
              // Expanded(
              //     child: SingleChildScrollView(
              //         child: Padding(
              //             padding: EdgeInsets.all(Dimens.gap_dp20),
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   ChatInputWidget()
              //                 ]))))
            ],
          )
        ]));
  }
}
