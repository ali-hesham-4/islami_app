import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/Hadeth/hadeth_screen.dart';
import 'package:islami_app/screens/Quran/quran_screen.dart';
import 'package:islami_app/screens/Radio/radio_screen.dart';
import 'package:islami_app/screens/Sebha/sebha_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/screens/settings/setting_screen.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.appTheme == ThemeMode.dark
            ? Image.asset("assets/images/home_dark_background-1.png")
            : Image.asset("assets/images/back_ground.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
            appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.appName),
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
                      icon: const ImageIcon(
                          AssetImage("assets/images/quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/images/hadeth.png")),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/images/sebha.png")),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/images/radio.png")),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ],
              ),
            ))
      ],
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const SettingScreen(),
  ];
}
