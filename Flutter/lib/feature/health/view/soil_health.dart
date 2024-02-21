import 'package:auto_route/auto_route.dart';
import 'package:enigma/feature/field/widget/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../field/view/field_view.dart';
import '../widget/line_chart.dart';

@RoutePage()
class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

List<Color> _color = [
  Colors.red.shade500,
  Colors.green.shade500,
  Colors.blue.shade700,
];
List<String> madde = ['Nitrogen', 'Phosphorus', 'Potassium'];

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300.withOpacity(0.9),
      body: SafeArea(
        child: ListView(
          children: [
            appBar(context, 'Soil Health'),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: PieChartt(health: true),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w, top: 50.h),
                        child: ListView.separated(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return _fields(_color[index], madde[index]);
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
            SizedBox(height: 10.h),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: LineChartt(),
            )
          ],
        ),
      ),
    );
  }
}

Row _fields(Color color, String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 15.w,
        height: 15.h,
        color: color,
      ),
      Text(subtitle),
    ],
  );
}
