import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/Quran/item_sura_details_data.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.appTheme == ThemeMode.dark
          ? Image.asset("assets/images/home_dark_background-1.png")
          : Image.asset("assets/images/back_ground.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
              title: const Text("Islami"),
              titleTextStyle: Theme.of(context).textTheme.bodyLarge),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor))
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  decoration: BoxDecoration(
                    color: provider.appTheme == ThemeMode.dark
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("سورة ${args.name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: provider.appTheme == ThemeMode.dark
                                        ? AppColors.yellowColor
                                        : AppColors.blackColor,
                                  )),
                          const SizedBox(width: 15),
                          Icon(
                            Icons.play_circle_fill_rounded,
                            size: 30,
                            color: provider.appTheme == ThemeMode.dark
                                ? AppColors.yellowColor
                                : AppColors.blackColor,
                          )
                        ],
                      ),
                      Divider(
                        color: provider.appTheme == ThemeMode.dark
                            ? AppColors.yellowColor
                            : AppColors.primaryLightColor,
                        thickness: 2,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: provider.appTheme == ThemeMode.dark
                                  ? AppColors.yellowColor
                                  : AppColors.primaryLightColor,
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
