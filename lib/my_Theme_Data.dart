import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData {
  static final ThemeData LightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: AppColors.blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: AppColors.blackColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
              color: AppColors.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold)));

  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white)),
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          bodySmall: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 22,
              fontWeight: FontWeight.bold)));
}
