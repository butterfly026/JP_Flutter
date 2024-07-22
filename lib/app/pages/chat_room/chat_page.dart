import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.lightGreyBack,
                  width: 1.0, // Adjust the width of the border line
                ),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    TableCellSettings(
                        title: "個人チャット",
                        onTap: () {
                          Get.toNamed(AppRouter.chatMessage, parameters: {'title': '個人チャット'});
                        }),
                    TableCellSettings(
                        title: "依頼ごと",
                        onTap: () {
                          Get.toNamed(AppRouter.chatGroup);
                        }),
                  ],
                )),
          ))
        ],
      ),
    );
  }
}
