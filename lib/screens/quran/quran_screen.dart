import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/screens/quran/item_sura_name.dart';
import 'package:islami_app/screens/quran/item_sura_number.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});
  List<String> names = [
    "الفاتحة",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset("assets/images/quran_logo.png")),
          Divider(
            color: AppColors.primaryLightColor,
            thickness: 3,
          ),
          Row(
            children: [
              Expanded(
                  child: Text("Sura Name",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center)),
              SizedBox(
                height: 35,
                child: VerticalDivider(
                  color: AppColors.primaryLightColor,
                  thickness: 3,
                ),
              ),
              Expanded(
                  child: Text(
                "Sura Number",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )),
            ],
          ),
          Divider(
            color: AppColors.primaryLightColor,
            thickness: 3,
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                        child: ItemSuraName(name: names[index], index: index)),
                    SizedBox(
                      height: 35,
                      child: VerticalDivider(
                        color: AppColors.primaryLightColor,
                        thickness: 3,
                      ),
                    ),
                    Expanded(
                        child: ItemSuraNumber(
                      name: names[index],
                      index: index,
                    )),
                  ],
                );
              },
              itemCount: names.length,
            ),
          )
        ],
      ),
    );
  }
}
