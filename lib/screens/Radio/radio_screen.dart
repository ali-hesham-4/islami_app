import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.13),
        Image.asset(
            "assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png"),
        SizedBox(height: size.height * 0.05),
        Text(AppLocalizations.of(context)!.holyQuranBroadCast,
            style: theme.textTheme.bodyMedium),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.skip_previous_rounded,
                color: provider.appTheme == ThemeMode.dark
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                size: 50,
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.play_arrow,
                color: provider.appTheme == ThemeMode.dark
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                size: 70,
              ),
            ),
            const SizedBox(width: 40),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.skip_next,
                color: provider.appTheme == ThemeMode.dark
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                size: 50,
              ),
            )
          ],
        )
      ],
    );
  }
}
