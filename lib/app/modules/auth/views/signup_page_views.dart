import 'dart:math';
import 'package:flutter/material.dart';
import 'package:telkomedika_app/app/widgets/buttonSiginWithGoogle_widget.dart';
import 'package:telkomedika_app/app/widgets/buttonTextLink_widget.dart';
import 'package:telkomedika_app/app/widgets/inputField_widget.dart';
import 'package:telkomedika_app/app/widgets/titleBar_widget.dart';
import 'package:telkomedika_app/app/widgets/welcomeGreeting_widget.dart';
import 'login_page_views.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';
import 'package:telkomedika_app/app/modules/auth/services/auth.dart';

class SignUpPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleBar(
                title: "Sign Up",
                onBack: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetStartPage()));
                },
              ),
              // Greeting Message
              WelcomeGreeting(greeting: "Welcome!"),
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
              // Sign Up Button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: max(MediaQuery.of(context).size.width * 0.8, 100),
                    child: ButtonWidget(
                        text: 'Sign Up',
                        onPressed: () async {
                          final user = await _authController.register(
                              _emailController.text, _passwordController.text);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Sign Up Gagal")),
                            );
                          }
                        }),
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
