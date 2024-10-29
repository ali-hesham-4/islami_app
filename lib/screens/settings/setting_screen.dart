import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/screens/settings/langugeBottomSheet.dart';
import 'package:islami_app/screens/settings/themeBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    void showLangugeBottomSheet(context) {
      showModalBottomSheet(
          context: context, builder: (context) => LangugeBottomSheet());
    }

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showLangugeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryLightColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic),
                  Icon(Icons.arrow_drop_down_outlined, size: 40)
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryLightColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appTheme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark),
                  Icon(Icons.arrow_drop_down_outlined, size: 40)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => Themebottomsheet());
  }
}
