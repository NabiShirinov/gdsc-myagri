import 'package:dio/dio.dart';
import 'package:enigma/contants/extension_size.dart';
import 'package:enigma/contants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants/api.dart';
import '../weather_model.dart';

class AirCondition extends StatefulWidget {
  const AirCondition({super.key});

  @override
  State<AirCondition> createState() => _AirConditionState();
}

class _AirConditionState extends State<AirCondition> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: apiCall(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 120.h),
            height: 50.h,
            width: 50.w,
            child: const CircularProgressIndicator(),
          );
        } else {
          Weather weather = snapshot.data!;

          List<String> title = [
            'Humidity',
            'Precipitation',
            'Pressure',
            'Wind'
          ];
          List<String> subTitle = [
            '${weather.humidity}%',
            '5.1ml',
            '${weather.pressure}hPa',
            '${weather.wind}m/s'
          ];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.r),
            ),
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15.h),
            width: context.screenWidth,
            height: context.screenHeight * .25,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: firstSection(weather),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 1.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 12.w);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => textColumn(
                        first: title[index],
                        second: subTitle[index],
                        firstTextStyle: ConstTextStyle.subTitleTextStyle!,
                        secondTextStyle:
                            ConstTextStyle.subTitleTextStyle!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  //function api
  Future<Weather> apiCall() async {
    Dio dio = Dio();
    Response response = await dio.get(weatherUrl);
    return Weather.fromJson(response.data['list'][0]);
  }

  Row firstSection(Weather weather) {
    int temp = (((weather.temp! - 32) * 5) ~/ 45);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/marker.svg',
                  width: 15,
                  height: 15,
                ),
                Text(
                  'Baki-Azərbaycan',
                  style: ConstTextStyle.titleTextStyle,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Text(
                  '+$temp',
                  style: ConstTextStyle.titleTextStyle!.copyWith(fontSize: 42),
                ),
                SizedBox(width: 25.w),
                textColumn(
                  first: 'H:23C',
                  second: 'L:14C',
                  firstTextStyle: ConstTextStyle.subTitleTextStyle!,
                  secondTextStyle: ConstTextStyle.subTitleTextStyle!,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: SvgPicture.asset(
            'assets/cloud.svg',
            width: 65,
            height: 65,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}

Column textColumn({
  required String first,
  required String second,
  required TextStyle firstTextStyle,
  required TextStyle secondTextStyle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        first,
        style: firstTextStyle,
      ),
      Text(
        second,
        style: secondTextStyle,
      ),
    ],
  );
}
