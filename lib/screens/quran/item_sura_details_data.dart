import 'package:flutter/material.dart';

class ItemSuraDetailsData extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetailsData({required this.content, required this.index});
  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      '$content (${index + 1})',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
