import 'package:enigma/contants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FormChart extends StatelessWidget {
  final bool? health;
  const FormChart({
    super.key,
    this.health,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCircularChart(
          series: _getRadialBarDefaultSeries(),
        ),
        health == true ? healthColumn() : fieldColumn(),
      ],
    );
  }
}

Positioned fieldColumn() {
  return Positioned(
    top: 100,
    left: 81,
    child: Column(
      children: [
        SvgPicture.asset(
          'assets/wheat.svg',
          width: 50,
          height: 50,
          colorFilter:
              ColorFilter.mode(Colors.yellow.shade700, BlendMode.srcIn),
        ),
        Text(
          'Harvest',
          style: ConstTextStyle.titleTextStyle,
        ),
        Text(
          '20 days',
          style: ConstTextStyle.subTitleTextStyle,
        ),
      ],
    ),
  );
}

Positioned healthColumn() {
  return Positioned(
    top: 122,
    left: 85,
    child: Column(
      children: [
        Text(
          '80%',
          style: ConstTextStyle.titleTextStyle!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Good',
          style: ConstTextStyle.subTitleTextStyle,
        ),
      ],
    ),
  );
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
      maximumValue: 15,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
      dataSource: <ChartSampleData>[
        ChartSampleData(
          x: '',
          y: 12,
          text: 'Salam',
          pointColor: Colors.green,
        ),
      ],
      cornerStyle: CornerStyle.bothCurve,
      gap: '89%',
      radius: '160%',
      xValueMapper: (ChartSampleData data, _) => data.x,
      yValueMapper: (ChartSampleData data, _) => data.y,
      pointRadiusMapper: (ChartSampleData data, _) => data.text,
      pointColorMapper: (ChartSampleData data, _) => data.pointColor,
      dataLabelMapper: (ChartSampleData data, _) => data.x,
    )
  ];
}

class ChartSampleData {
  String? x, text;
  double? y;
  Color? pointColor;
  ChartSampleData({
    this.pointColor,
    this.text,
    this.x,
    this.y,
  });
}
