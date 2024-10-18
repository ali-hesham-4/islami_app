import 'package:flutter/material.dart';
import 'package:islami_app/screens/Quran/sura_details_screen.dart';

class ItemSuraNumber extends StatelessWidget {
  int index;
  String name;
  ItemSuraNumber({required this.name, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text("${index + 1}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
