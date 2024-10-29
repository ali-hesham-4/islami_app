import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> Azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله الا الله",
    "الله أكبر",
    "لا حول ولا قوة الا بالله",
  ];
  int index = 0;
  int counter = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              provider.appTheme == ThemeMode.dark
                  ? Image.asset("assets/images/head of dark seb7a.png")
                  : Image.asset("assets/images/head of seb7a.png"),
              Padding(
                  padding: provider.appTheme == ThemeMode.dark
                      ? EdgeInsets.only(top: size.height * 0.08)
                      : EdgeInsets.only(top: size.height * 0.04),
                  child: InkWell(
                    onTap: () {
                      onZekrClicked();
                    },
                    child: Transform.rotate(
                        angle: angle,
                        child: provider.appTheme == ThemeMode.dark
                            ? Image.asset(
                                "assets/images/body of dark seb7a.png")
                            : Image.asset("assets/images/body of seb7a.png")),
                  )),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Text(
            AppLocalizations.of(context)!.tasbehCount,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.05),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.primaryColor.withOpacity(0.7),
              ),
              child: Text(
                "$counter",
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: size.height * 0.05),
          InkWell(
            onTap: () {
              onZekrClicked();
            },
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: provider.appTheme == ThemeMode.dark
                      ? AppColors.yellowColor
                      : AppColors.primaryLightColor,
                ),
                child: Text(
                  Azkar[index],
                  style: TextStyle(
                      color: provider.appTheme == ThemeMode.dark
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                      fontSize: 25),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }

  onZekrClicked() {
    if (counter < 33) {
      counter++;
      angle += 0.12;
    } else {
      counter = 0;
      index++;
    }
    if (index == 5) {
      index = 0;
    }
    setState(() {});
  }
}
