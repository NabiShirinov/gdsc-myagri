import 'package:auto_route/auto_route.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/widget/double_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants/text.dart';
import '../../form/view/select_crop.dart';

List<String> svgs = [
  'assets/hand_and_plant.svg',
  'assets/thermometr.svg',
  'assets/plant.svg',
];
List<Color> color = [
  Colors.green.shade600,
  Colors.deepOrange.shade600,
  Colors.blue.shade800,
];
List<String> bodyTitle = [
  'Planting date',
  'Accumulated GDD',
  'Soil Health',
];
Map<String, List<String>> bodySubtitle = {
  'title': [
    '${info.date}',
    '4413.4',
    '10%',
  ],
  'subtitle': [
    'in 6 months',
    'dogF',
    'Good',
  ],
};

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight / 2.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
      child: Column(
        children: [
          title(title: 'Crop Status', subtitle: 'Setup'),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight / 3.6,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => _body(index, context),
            ),
          ),
        ],
      ),
    );
  }
}

Row title({required String title, required String subtitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: ConstTextStyle.titleTextStyle!.copyWith(fontSize: 20),
      ),
      Text(
        subtitle,
        style: ConstTextStyle.subTitleTextStyle!
            .copyWith(color: Colors.green[600]),
      )
    ],
  );
}

InkWell _body(int index, BuildContext context) {
  return InkWell(
    onTap: index == 2
        ? () {
            context.router.pushNamed('/health');
          }
        : () {},
    child: Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon(color: color[index], name: svgs[index]),
              SizedBox(width: 8.w),
              Text(
                bodyTitle[index],
                style: ConstTextStyle.titleTextStyle!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          TextColumn(
            crossAxisAlignment: CrossAxisAlignment.end,
            title: bodySubtitle['title']![index],
            subTitle: bodySubtitle['subtitle']![index],
            titleSize: 14,
          ),
        ],
      ),
    ),
  );
}

Container icon({required String name, required Color color}) {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: SvgPicture.asset(
      name,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      width: 20,
      height: 20,
    ),
  );
}
