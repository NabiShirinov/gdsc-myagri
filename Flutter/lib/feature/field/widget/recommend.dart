import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:enigma/feature/field/widget/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Color> colors = [
  Colors.green.shade300,
  Colors.lightBlue,
  Colors.red.shade200,
];
List<String> recommandations = [
  'Scout fields for early insect infestations\nand control potentially\ndamaging insects.',
  'Control soil health in every 2 week',
  '',
];

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight / 2.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
      child: Column(
        children: [
          title(title: 'Recommendation', subtitle: 'History'),
          SizedBox(height: 10.h),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight / 3.6,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => _body(index: index),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
            ),
          ),
        ],
      ),
    );
  }
}

Column _body({required int index}) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: colors[index],
        ),
        width: 150,
        height: 150,
        child: Text(
          recommandations[index],
          style: ConstTextStyle.subTitleTextStyle!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0.0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Done',
            style: ConstTextStyle.subTitleTextStyle,
          ),
        ),
      )
    ],
  );
}
