import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telkomedika_app/app/modules/auth/controllers/login_controller.dart';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'dart:math';
import 'signup_page_views.dart';
// Widgets
import 'package:telkomedika_app/app/widgets/button_sigin_with_google_widget.dart';
import 'package:telkomedika_app/app/widgets/button_text_link_widget.dart';
import 'package:telkomedika_app/app/widgets/input_field_widget.dart';
import 'package:telkomedika_app/app/widgets/titlebar_widget.dart';
import 'package:telkomedika_app/app/widgets/welcomeGreeting_widget.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';

class LoginPage extends StatelessWidget {
  final _authController = AuthController();
  final LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});

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
                title: "Login",
                onBack: () {
                  Get.offAll(() => GetStartPage());
                },
              ),
              // Greeting Message
              WelcomeGreeting(greeting: "Welcome Back!"),
              // Email Input
              InputField(
                label: "Masukan Email",
                hintText: "example@gmail.com",
                controller: loginController.emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              // Password Input
              InputField(
                label: "Password",
                hintText: "********",
                controller: loginController.passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              // Login Button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Container(
                        padding: const EdgeInsets.only(top: 30),
                        width:
                            max(MediaQuery.of(context).size.width * 0.8, 100),
                        child: loginController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : ButtonWidget(
                                text: 'Log In',
                                onPressed: () => loginController.login(context),
                              ),
                      )),
                  // Social Media Button (Google Sign In)
                  ButtonTextLink(
                      text: "Don't have an account? Sign Up",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
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
