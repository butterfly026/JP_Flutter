import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/controllers/request_detail_controller.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/config/images.dart';
import 'package:fpg_flutter/public/models/business/request_list_data.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/image.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class RequestDetailPage extends StatefulWidget {
  const RequestDetailPage({super.key});

  @override
  _RequestDetailPageState createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late RequestDetailController _controller;
  List<RequestListData> requestList = RequestListData.requestList;
  RequestListData? selectedData = RequestListData.requestList[0];

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    int curIndex = int.tryParse(Get.parameters['index'] ?? '') ?? 0;
    selectedData = RequestListData.requestList[curIndex];
    _controller = RequestDetailController();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.white,
        body: Stack(children: [
          Column(
            children: [
              CustomAppBar(
                titleSpacing: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: Text(
                  // ignore: invalid_use_of_protected_member
                  '依頼詳細',
                  style: TextStyle(
                    fontSize: Dimens.font_sp28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: false,
              ),
              Expanded(
                child: GetBuilder<RequestDetailController>(
                    init: _controller,
                    builder: (controller) {
                      return Column(
                        children: [
                          if (selectedData != null &&
                              selectedData!.status == '募集中')
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.0,
                                        color: AppTheme.info,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Text(selectedData!.status,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: AppTheme.info)),
                                  ),
                                ],
                              ),
                            ),
                          if (selectedData != null &&
                              selectedData!.status == '依頼確定')
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('メニュー', style: AppTheme.body2),
                            ),
                          Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                children: [
                                  TableCellSettings(
                                      title: "シフト",
                                      onTap: () {
                                        Navigator.pushNamed(context, '/pro');
                                      }),
                                  TableCellSettings(
                                      title: "お知らせ",
                                      onTap: () {
                                        Navigator.pushNamed(context, '/pro');
                                      }),
                                  TableCellSettings(
                                      title: "個人情報編集",
                                      onTap: () {
                                        Navigator.pushNamed(context, '/pro');
                                      }),
                                  TableCellSettings(
                                      title: "アカウント設定",
                                      onTap: () {
                                        Navigator.pushNamed(context, '/pro');
                                      }),
                                ],
                              ))
                        ],
                      );
                    }),
              ),
            ],
          )
        ]));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
