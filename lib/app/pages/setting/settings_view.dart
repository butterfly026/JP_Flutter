import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  SettingViewState createState() => SettingViewState();
}

class SettingViewState extends State<SettingView> {
  final AuthController authController = Get.find();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AccountView')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.login('test@example.com', 'password');
          },
          child: const Text('AccountView'),
        ),
      ),
    );
  }
}
