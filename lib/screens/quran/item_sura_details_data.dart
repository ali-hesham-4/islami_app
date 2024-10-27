import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetailsData extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetailsData({super.key, required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      '$content (${index + 1})',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: provider.appTheme == ThemeMode.dark
                ? AppColors.yellowColor
                : AppColors.blackColor,
          ),
    );
  }
}
