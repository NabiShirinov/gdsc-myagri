import 'package:enigma/contants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartt extends StatelessWidget {
  final bool? health;
  final bool? form;
  final String? harvestDate;
  const PieChartt({
    super.key,
    this.health,
    this.harvestDate = '20 days',
    this.form = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCircularChart(
          series: _getRadialBarDefaultSeries(health: health),
        ),
        health == true ? healthColumn() : fieldColumn(form: form),
      ],
    );
  }
}

Positioned fieldColumn({String? date = '20 days', bool? form}) {
  return Positioned(
    top: 100,
    left: 81,
    child: Column(
      children: [
        SvgPicture.asset(
          'assets/lemon.svg',
          width: 50,
          height: 50,
          // colorFilter: form == true
          //     ? null
          //     : ColorFilter.mode(Colors.yellow.shade700, BlendMode.srcIn),
        ),
        Text(
          'Harvest',
          style: ConstTextStyle.titleTextStyle,
        ),
        Text(
          date!,
          style: ConstTextStyle.subTitleTextStyle,
        ),
      ],
    ),
  );
}

Positioned healthColumn() {
  return Positioned(
    top: 122,
    left: 72,
    child: Column(
      children: [
        Text(
          '80%',
          style: ConstTextStyle.titleTextStyle!
              .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Plant Crop',
          style: ConstTextStyle.subTitleTextStyle,
        ),
      ],
    ),
  );
}

List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries(
    {bool? health = false}) {
  return <RadialBarSeries<ChartSampleData, String>>[
    RadialBarSeries<ChartSampleData, String>(
      maximumValue: 15,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10.0)),
      dataSource: <ChartSampleData>[
        ChartSampleData(
          x: '',
          y: health == true ? 12 : 0.7,
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
