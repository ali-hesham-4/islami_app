import 'package:flutter/material.dart';
import 'package:islami_app/screens/Hadeth/hadeth_details_screen.dart';
import 'package:islami_app/screens/Hadeth/hadeth_screen.dart';

class ItemHadethNumber extends StatelessWidget {
  Hadeth hadeth;
  ItemHadethNumber({super.key, required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(hadeth.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
