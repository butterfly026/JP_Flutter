import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/public/widgets/table-cell.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
          ))),
    );
  }
}
