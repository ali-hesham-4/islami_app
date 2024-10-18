import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.13),
        Image.asset(
            "assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png"),
        SizedBox(height: size.height * 0.05),
        Text("Holy Quran Broadcast", style: theme.textTheme.bodyMedium),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.skip_previous_rounded,
                color: theme.primaryColor,
                size: 50,
              ),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.play_arrow,
                color: theme.primaryColor,
                size: 70,
              ),
            ),
            SizedBox(width: 40),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.skip_next,
                color: theme.primaryColor,
                size: 50,
              ),
            )
          ],
        )
      ],
    );
  }
}
