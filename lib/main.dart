import 'package:flutter/material.dart';
import 'views/landing_page_views.dart';
import 'package:telkomedika_app/view/get_start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telkomedika App',
      debugShowCheckedModeBanner: false,
      home: GetStartPage(),
    );
  }
}
