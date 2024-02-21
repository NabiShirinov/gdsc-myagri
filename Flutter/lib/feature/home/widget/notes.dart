import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:enigma/contants/widget/double_text.dart';
import 'package:enigma/feature/form/view/form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

List<String> date = ['May 31 5:43 pm', 'May 26 8:20 am'];
List<String> notifications = [
  'Humidity level is low, you should water\nthe field.',
  'There is probability of rain, you should\nwater the field'
];

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: Colors.white,
      ),
      width: context.screenWidth,
      height: context.screenHeight * .34,
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 16, right: 18, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: ConstTextStyle.titleTextStyle!.copyWith(fontSize: 18),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
          notes('assets/weath.jpg', 0),
          SizedBox(height: 8.h),
          notes('assets/weath2.jpg', 1),
          SizedBox(height: 8.h),
          SizedBox(width: 200, height: 40, child: noteButton(title: 'More'))
        ],
      ),
    );
  }
}

Row notes(String image, int index) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(width: 10.w),
      TextColumn(
        fontSize: 12,
        title: date[index],
        subTitle: notifications[index],
      ),
    ],
  );
}
