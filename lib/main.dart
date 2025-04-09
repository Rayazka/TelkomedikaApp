import 'package:flutter/material.dart';
import 'views/landing_page_views.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telkomedika App',
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
