import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

BarChartData bar() {
  return BarChartData(
    titlesData: titlesData,
    borderData: borderData,
    barGroups: barGroups,
    gridData: FlGridData(show: false),
    //alignment: BarChartAlignment.spaceAround,
    maxY: 20,
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Jan';
      break;
    case 1:
      text = 'Feb';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Apr';
      break;
    case 4:
      text = 'May';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    //space: 0,
    child: Text(text, style: style),
  );
}

FlTitlesData get titlesData => FlTitlesData(
  show: true,
  bottomTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: false,
      reservedSize: 30,
    ),
  ),
  leftTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
  rightTitles: AxisTitles(
    sideTitles: SideTitles(showTitles: false),
  ),
);

FlBorderData get borderData => FlBorderData(
  show: false,
);

LinearGradient get _barsGradient => const LinearGradient(
  colors: [
    Colors.greenAccent,
    Colors.green,
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

List<BarChartGroupData> get barGroups => [
  BarChartGroupData(
    x: 0,
    barRods: [
      BarChartRodData(
        toY: 18,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 1,
    barRods: [
      BarChartRodData(
        toY: 10,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        toY: 14,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        toY: 15,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [
      BarChartRodData(
        toY: 13,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 5,
    barRods: [
      BarChartRodData(
        toY: 10,
        gradient: _barsGradient,
      )
    ],
  ),
  BarChartGroupData(
    x: 6,
    barRods: [
      BarChartRodData(
        toY: 16,
        gradient: _barsGradient,
      )
    ],
  ),
];