import 'dart:math';
import 'package:flutter/material.dart';
import 'package:telkomedika_app/app/modules/home/views/home.dart';
import 'package:telkomedika_app/app/widgets/buttonSiginWithGoogle_widget.dart';
import 'package:telkomedika_app/app/widgets/buttonTextLink_widget.dart';
import 'package:telkomedika_app/app/widgets/inputField_widget.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';
import 'package:telkomedika_app/app/widgets/welcomeGreeting_widget.dart';
import 'signup_page_views.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleBar(
                title: "Login",
                onBack: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStartPage()));
                },
              ),
              // Greeting Message
              WelcomeGreeting(greeting: "Welcome Back!"),
              // Email Field
              InputField(
                  label: "Masukan Email",
                  hintText: "example@gmail.com",
                  controller: _emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              // Password Field
              InputField(
                  label: "Password",
                  hintText: "********",
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword),
              // Login Button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: max(MediaQuery.of(context).size.width * 0.8, 100),
                    child: ButtonWidget(
                        text: 'Login',
                        onPressed: () async {
                          final user = await _authController.login(
                              _emailController.text, _passwordController.text);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Gagal")),
                            );
                          }
                        }),
                  ),
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
