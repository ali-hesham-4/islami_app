import 'package:flutter/material.dart';
import 'package:islami_app/my_Theme_Data.dart';
import 'package:islami_app/screens/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/screens/Quran/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      theme: MyThemeData.LightMode,
    );
  }
}
