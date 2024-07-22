import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authController = Get.find<AuthController>();
    if (!authController.isAuthenticated.value) {
      return const RouteSettings(name: '/login');
    }
    return null; // Allow access if authenticated
  }
}
