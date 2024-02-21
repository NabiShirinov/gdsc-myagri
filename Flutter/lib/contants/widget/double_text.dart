import 'package:enigma/contants/text.dart';
import 'package:flutter/material.dart';

class TextColumn extends StatelessWidget {
  final String title, subTitle;
  final double? fontSize, titleSize;
  final CrossAxisAlignment? crossAxisAlignment;
  const TextColumn(
      {super.key,
      required this.subTitle,
      required this.title,
      this.fontSize = 14,
      this.titleSize = 16,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: [
        Text(
          title,
          style: ConstTextStyle.titleTextStyle!.copyWith(fontSize: titleSize),
        ),
        Text(
          subTitle,
          style: ConstTextStyle.subTitleTextStyle!.copyWith(fontSize: fontSize),
        )
      ],
    );
  }
}
