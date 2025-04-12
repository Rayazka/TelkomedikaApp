import 'dart:math';
import 'package:flutter/material.dart';
import 'login_page_views.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';
import 'package:telkomedika_app/app/modules/auth/controllers/auth.dart';

class SignUpPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetStartPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 244, 31, 38),
                          fontSize: MediaQuery.of(context).size.width *
                              0.06, // Responsif
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 34, left: 30),
                        child: Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 244, 31, 38),
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.only(top: 16, left: 30),
                        child: Text(
                          "TelkoMedika merupakan perusahaan penyedia layanan kesehatan (Healthcare Provider) yang memberikan layanan solusi kesehatan untuk masyarakat umum berupa Klinik, Laboratorium, Apotek, Optik dan Layanan Kesehatan.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontWeight: FontWeight.w200),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15, left: 30),
                        child: Text(
                          "Masukan Email",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 16),
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              hintText: 'example@example.com',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF737473),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide:
                                    BorderSide(color: Color(0xFF737473)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide:
                                    BorderSide(color: Color(0xFF737473)),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 15, left: 30),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 16),
                          child: TextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              hintText: '*********',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF737473),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide:
                                    BorderSide(color: Color(0xFF737473)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide:
                                    BorderSide(color: Color(0xFF737473)),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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

                          print(user);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Sign Up gagal")),
                            );
                          }
                        }),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        color: Color.fromARGB(255, 95, 95, 95),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "or sign in with",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                      onPressed: () => AuthController().signInWithGoogle(),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        backgroundColor:
                            const Color.fromARGB(255, 220, 230, 255),
                        elevation: 2,
                      ),
                      child: Image.asset(
                        'assets/images/Google.png',
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
