import 'package:auto_route/auto_route.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingSection extends StatefulWidget {
  const AddingSection({super.key});

  @override
  State<AddingSection> createState() => _AddingSectionState();
}

class _AddingSectionState extends State<AddingSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/form'),
      child: Container(
        width: context.screenWidth * .44,
        height: context.screenHeight * .248,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            const Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 15.h),
            Text(
              'Add field',
              style: ConstTextStyle.titleTextStyle!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
