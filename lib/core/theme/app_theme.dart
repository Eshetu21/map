
import 'package:flutter/material.dart';
import 'package:map/core/theme/app_pallet.dart';

class AppTheme {
 
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: textColor,
          fontFamily: 'ProductSans',
        ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: hintTextColor),
      contentPadding: EdgeInsets.all(16),
    ),
  );
}

