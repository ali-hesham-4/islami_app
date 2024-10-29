import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/Hadeth/hadeth_screen.dart';
import 'package:islami_app/screens/Hadeth/item_hadeth_details_data.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetailsScreen";

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      provider.appTheme == ThemeMode.dark
          ? Image.asset("assets/images/home_dark_background-1.png",
              width: double.infinity, height: double.infinity, fit: BoxFit.fill)
          : Image.asset("assets/images/back_ground.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
              title: Text(args.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? AppColors.yellowColor
                            : AppColors.blackColor,
                      )),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge),
          body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.06),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.dark
                  ? AppColors.primaryDarkColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ))
    ]);
  }
}
