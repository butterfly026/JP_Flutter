import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isAuthenticated = false.obs;

  void login(String email, String password) {
    // Simulate login process
    if (email == 'test@example.com' && password == 'password') {
      isAuthenticated.value = true;
      Get.offNamed('/'); // Navigate to home after successful login
    } else {
      // Handle invalid credentials
      Get.snackbar('Error', 'Invalid credentials');
    }
  }

  void logout() {
    isAuthenticated.value = false;
    Get.offAllNamed('/login'); // Navigate to login after logout
  }

}