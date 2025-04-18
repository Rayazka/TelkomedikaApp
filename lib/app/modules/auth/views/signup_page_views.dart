import 'dart:math';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'login_page_views.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/auth/controllers/signup_controller.dart';

// Widgets
import 'package:telkomedika_app/app/widgets/buttonSiginWithGoogle_widget.dart';
import 'package:telkomedika_app/app/widgets/buttonTextLink_widget.dart';
import 'package:telkomedika_app/app/widgets/inputField_widget.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';
import 'package:telkomedika_app/app/widgets/welcomeGreeting_widget.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';

class SignUpPage extends StatelessWidget {
  final _authController = AuthController();
  final controller = Get.put(SignUpController());

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Title Bar / Header
              TitleBar(
                title: "Sign Up",
                onBack: () {
                  Get.offAll(() => LoginPage());
                },
              ),
              // Greeting Message
              WelcomeGreeting(greeting: "Welcome!"),
              // Username Field
              InputField(
                  label: "Masukan Username",
                  hintText: "John Doe",
                  controller: controller.usernameController,
                  obscureText: false,
                  keyboardType: TextInputType.name),
              // Email Field
              InputField(
                  label: "Masukan Email",
                  hintText: "example@gmail.com",
                  controller: controller.emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              // Password Field
              InputField(
                  label: "Password",
                  hintText: "********",
                  controller: controller.passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword),
              // Sign Up Button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.only(top: 30),
                      width: max(MediaQuery.of(context).size.width * 0.8, 100),
                      child: controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : ButtonWidget(
                              text: 'Sign Up',
                              onPressed: () => controller.signUp(),
                            ),
                    ),
                  ),

                  // Social Media Button (Google Sign In)
                  ButtonTextLink(
                      text: "Already have an account? Login",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  ButtonSignInWithGoogle(
                      onGoogleTap: () => _authController.signInWithGoogle())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
