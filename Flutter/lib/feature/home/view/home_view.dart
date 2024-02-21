import 'package:auto_route/auto_route.dart';
import 'package:enigma/feature/home/widget/air_condition.dart';
import 'package:enigma/feature/home/widget/land_field.dart';
import 'package:enigma/feature/home/widget/notes.dart';
import 'package:enigma/feature/home/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/add_land.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300.withOpacity(0.9),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ListView(
              children: [
                SizedBox(height: 10.h),
                appbar(),
                SizedBox(height: 10.h),
                const AirCondition(),
                SizedBox(height: 10.h),
                const Notes(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const LandField(),
                    SizedBox(width: 10.w),
                    const AddingSection()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row appbar() {
  return const Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
          width: 280,
          height: 45,
          child: MyTextField(
            iconName: 'assets/search.svg',
          )),
      CircleAvatar(
        backgroundColor: Colors.blue,
      ),
    ],
  );
}
