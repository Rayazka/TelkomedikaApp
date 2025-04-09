import 'dart:math';

import 'package:flutter/material.dart';
import 'package:telkomedika_app/widgets/button_widget.dart';

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
                'assets/images/logo_telkomedika.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 40),
              child: Text(
                'Welcome to Telkomedika',
                style: TextStyle(
                  color: Color.fromARGB(255, 244, 31, 38),
                  fontSize: MediaQuery.of(context).size.width * 0.04,
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
                  fontSize: MediaQuery.of(context).size.width * 0.026,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
              ),
              width: max(MediaQuery.of(context).size.width * 0.6, 50),
              child: ButtonWidget(
                  text: 'Get Started',
                  onPressed: () {
                    print('object');
                  }),
            )
          ],
        ),
      ),
    );
  }
}
