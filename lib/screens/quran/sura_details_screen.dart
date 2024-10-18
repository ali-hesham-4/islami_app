import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/screens/quran/item_sura_details_data.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset("assets/images/back_ground.png",
          width: double.infinity, height: double.infinity, fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
              title: Text("Islami"),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor))
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("سورة ${args.name}",
                              style: Theme.of(context).textTheme.bodyLarge),
                          SizedBox(width: 15),
                          Icon(
                            Icons.play_circle_fill_rounded,
                            size: 30,
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.primaryLightColor,
                        thickness: 2,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: AppColors.primaryLightColor,
                              thickness: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ItemSuraDetailsData(
                                content: verses[index], index: index);
                          },
                          itemCount: verses.length,
                        ),
                      ),
                    ],
                  )))
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;
  SuraDetailsArgs({required this.name, required this.index});
}
