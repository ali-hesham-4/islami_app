import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/screens/Hadeth/hadeth_screen.dart';
import 'package:islami_app/screens/Quran/quran_screen.dart';
import 'package:islami_app/screens/Radio/radio_screen.dart';
import 'package:islami_app/screens/Sebha/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static int selectedIndex = 0;
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/back_ground.png",
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
            appBar: AppBar(
                title: Text("Islami"),
                titleTextStyle: Theme.of(context).textTheme.bodyLarge),
            body: tabs[HomeScreen.selectedIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                currentIndex: HomeScreen.selectedIndex,
                onTap: (index) {
                  HomeScreen.selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/quran.png")),
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
                      label: "Hadeth"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                      label: "Sebha"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/images/radio.png")),
                      label: "Radio"),
                ],
              ),
            ))
      ],
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
  ];
}
