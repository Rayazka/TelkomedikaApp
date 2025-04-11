import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    );
  }
}
