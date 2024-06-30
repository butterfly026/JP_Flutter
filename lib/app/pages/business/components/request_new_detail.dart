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

class RequestNewDetailPage extends StatefulWidget {
  const RequestNewDetailPage({super.key, this.selectedData});
  final RequestListData? selectedData;

  @override
  _RequestNewDetailPageState createState() => _RequestNewDetailPageState();
}

class _RequestNewDetailPageState extends State<RequestNewDetailPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late RequestDetailController _controller;
  RequestListData? selectedData;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    selectedData = widget.selectedData;
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
    return Expanded(
      child: GetBuilder<RequestDetailController>(
          init: _controller,
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.all(Dimens.gap_dp10),
              child: Column(
                children: [
                  if (selectedData != null && selectedData!.status == '募集中')
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
                  if (selectedData != null && selectedData!.status == '依頼確定')
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
              ),
            );
          }),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
