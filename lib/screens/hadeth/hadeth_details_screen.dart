import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/screens/hadeth/hadeth_screen.dart';
import 'package:islami_app/screens/hadeth/item_hadeth_details_data.dart';
import 'package:islami_app/screens/quran/item_sura_details_data.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetailsScreen";

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      Image.asset("assets/images/back_ground.png",
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
              title: Text(args.title,
                  style: Theme.of(context).textTheme.bodyLarge),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.06),
            decoration: BoxDecoration(
              color: Colors.white,
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
