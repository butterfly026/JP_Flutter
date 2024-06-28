import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AccountView')),
      body: Container(),
    );
  }
}
