import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup_page_views.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GetStartPage()),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.only(top: 63, left: 30),
                        child: Image.asset(
                          'assets/images/Vector.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.03,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 63, left: 119),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Color.fromARGB(255, 244, 31, 38),
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold,
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
                          "Welcome",
                          style: TextStyle(
                            color: Color.fromARGB(255, 244, 31, 38),
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width:
                            max(MediaQuery.of(context).size.width * 0.75, 324),
                        padding: const EdgeInsets.only(top: 16, left: 30),
                        child: Text(
                          "TelkoMedika merupakan perusahaan penyedia layanan kesehatan (Healthcare Provider) yang memberikan layanan solusi kesehatan untuk masyarakat umum berupa Klinik, Laboratorium, Apotek, Optik dan Layanan Kesehatan.",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.025,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200),
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
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 16),
                          child: TextField(
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
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 16),
                          child: TextField(
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
                    width: max(MediaQuery.of(context).size.width * 0.7, 100),
                    child: ButtonWidget(
                        text: 'Log In',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                          );
                        }),
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
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFD6E2FF),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/Google.png',
                        width: 23,
                        height: 33,
                        fit: BoxFit.contain,
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
