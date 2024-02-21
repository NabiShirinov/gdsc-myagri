import 'package:auto_route/auto_route.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:enigma/feature/field/widget/pie_chart.dart';
import 'package:enigma/feature/field/widget/recommend.dart';
import 'package:enigma/feature/field/widget/status.dart';
import 'package:enigma/feature/form/view/select_crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FieldScreen extends StatefulWidget {
  const FieldScreen({super.key});

  @override
  State<FieldScreen> createState() => _FieldScreenState();
}

//${info.cropName}
class _FieldScreenState extends State<FieldScreen> {
  List<String> title = ['Crop', 'Phase', 'Size', 'Sow date'];
  List<String> subtitle = [
    '${info.cropName}',
    'Planting',
    '${info.size}',
    '${info.date}',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.9),
      body: SafeArea(
        child: ListView(
          children: [
            appBar(context, '${info.cropName} Field'),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: PieChartt(),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w, top: 50.h),
                        child: ListView.separated(
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return fields(title[index], subtitle[index]);
                          },
                          separatorBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(top: 2.h),
                            height: 2,
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            const StatusBar(),
            SizedBox(height: 8.h),
            const Recommendation()
          ],
        ),
      ),
    );
  }
}

Row fields(String title, String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title),
      Text(subtitle),
    ],
  );
}

Container appBar(
  BuildContext context,
  String title,
) {
  return Container(
    color: Colors.white,
    width: context.screenWidth,
    height: context.screenHeight / 10,
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          title,
          style: ConstTextStyle.titleTextStyle!.copyWith(fontSize: 18),
        ),
      ],
    ),
  );
}
