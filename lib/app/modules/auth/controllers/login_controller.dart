import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';
import 'package:telkomedika_app/app/modules/home/views/home_page_views.dart';
import 'package:telkomedika_app/app/widgets/custom_alert_dialog.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = AuthController();

  RxBool isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    try {
      final user = await authController.login(
          emailController.text.trim(), passwordController.text.trim());

      if (user != null) {
        Get.offAll(() => HomePage()); // pindah ke HomePage
      } else {
        CustomAlertDialog.showError(
            title: "Login gagal", message: "Email atau password salah.");
      }
    } catch (e) {
      CustomAlertDialog.showError(title: "Terjadi kesalahan", message: "$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
