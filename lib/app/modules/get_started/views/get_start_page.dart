import 'dart:math';

import 'package:flutter/material.dart';
import 'package:telkomedika_app/app/modules/auth/views/login_page_views.dart';
import 'package:telkomedika_app/app/widgets/button_widget.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(
                'assets/images/splash_logo_telkomedika.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 40),
              child: Text(
                'Welcome to Telkomedika',
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 31, 38),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: max(MediaQuery.of(context).size.width * 0.75, 300),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Establish Better Healthiness Level for Community through Excellent Healthcare Service and Value Creation to all Stakeholder.',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
              ),
              width: max(MediaQuery.of(context).size.width * 0.6, 100),
              child: ButtonWidget(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
