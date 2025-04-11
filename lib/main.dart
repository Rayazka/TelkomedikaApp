import 'package:flutter/material.dart';
import 'package:telkomedika_app/app/modules/get_started/views/get_start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:telkomedika_app/app/themes/app_theme.dart';
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
      title: 'Telkomedika',
      theme: AppTheme.theme,
      home: GetStartPage(),
    );
  }
}
