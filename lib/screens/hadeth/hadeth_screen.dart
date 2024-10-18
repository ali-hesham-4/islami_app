import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/Screens/Quran/item_sura_name.dart';
import 'package:islami_app/Screens/Hadeth/item_hadeth_name.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFiles();
    }
    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/hadith_logo.png")),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Text("Hadeth Name", style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: ahadethList[index]);
                  },
                  itemCount: ahadethList.length,
                ),
        )
      ],
    );
  }

  void loadHadethFiles() async {
    String hedethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hedethContent.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;
  Hadeth({required this.title, required this.content});
}
