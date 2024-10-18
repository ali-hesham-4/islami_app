import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

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
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("assets/images/head of seb7a.png"),
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  child: InkWell(
                    onTap: () {
                      onZekrClicked();
                    },
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset("assets/images/body of seb7a.png")),
                  )),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            "Tasebeh Count",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.05),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.primaryColor.withOpacity(0.7),
              ),
              child: Text(
                "${counter}",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              )),
          SizedBox(height: size.height * 0.05),
          InkWell(
            onTap: () {
              onZekrClicked();
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: theme.primaryColor,
                ),
                child: Text(
                  "${Azkar[index]}",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 25),
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
