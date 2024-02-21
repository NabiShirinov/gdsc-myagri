import 'package:auto_route/auto_route.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/widget/double_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandField extends StatefulWidget {
  const LandField({super.key});

  @override
  State<LandField> createState() => _LandFieldState();
}

class _LandFieldState extends State<LandField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/field'),
      child: Container(
        width: context.screenWidth * .44,
        height: context.screenHeight * .248,
        padding: const EdgeInsets.only(left: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                width: 145,
                height: 135,
                child: Image.asset(
                  'assets/field_map.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 4),
              child: TextColumn(
                subTitle: '11ha - Ağdam',
                title: 'Wheat Field',
                fontSize: 12,
                titleSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
