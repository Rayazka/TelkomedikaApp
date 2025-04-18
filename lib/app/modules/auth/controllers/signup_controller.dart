import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';
import 'package:telkomedika_app/app/modules/auth/views/login_page_views.dart';
import 'package:telkomedika_app/app/widgets/customAlertDialog.dart';

class SignUpController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authController = AuthController();

  RxBool isLoading = false.obs;
  var username = ''.obs;

  Future<void> signUp() async {
    if (usernameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      CustomAlertDialog.showError(
        title: "Ooopss....",
        message: "Lengkapi dulu semua kolomnya ya",
      );
      return;
    }

    isLoading.value = true;

    try {
      final user = await authController.register(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        final uid = user.user!.uid;
        final name = usernameController.text.trim();

        // Update display name di Firebase Auth
        await user.user?.updateDisplayName(name);

        // Simpan data user ke Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'name': name,
          'email': emailController.text.trim(),
          'photoUrl': 'assets/images/users.png',
          'createdAt': Timestamp.now(),
        });

        username.value = name;

        CustomAlertDialog.showSuccess(
          title: "Sign Up Berhasil",
          message: "Akun berhasil dibuat. Silakan login.",
          onClose: () {
            Get.offAll(() => LoginPage());
          },
        );
      } else {
        CustomAlertDialog.showError(
            title: "Sign Up Gagal",
            message: "Periksa kembali email dan password Anda.");
      }
    } catch (e) {
      CustomAlertDialog.showError(
          title: "Error", message: "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
