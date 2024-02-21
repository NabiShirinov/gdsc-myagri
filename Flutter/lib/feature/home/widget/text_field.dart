import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyTextField extends StatelessWidget {
  final String? hintText, iconName;
  final TextEditingController? textEditingController;
  final Color? color;

  const MyTextField(
      {super.key,
      this.hintText = 'Search',
      required this.iconName,
      this.textEditingController,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 18, right: 12),
            height: 12,
            width: 12.w,
            child: SvgPicture.asset(iconName!),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(32.r),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          filled: true,
          fillColor: color,
        ),
      ),
    );
  }
}
