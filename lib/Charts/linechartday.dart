import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:expense_project/Dashboards/Dashboard.dart';

import '../Dashboards/forindexingday.dart';

List<Color> gradientColors = [
  const Color(0xff76A08C),
  const Color(0xff37604C),
];

LineChartData mainDataDay(List<ForIndexingDay> list) {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Color.fromARGB(255, 252, 252, 252),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Color.fromARGB(255, 255, 255, 255),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          interval: 1,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: false,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: (list.length).toDouble(),
    minY: 0,
    maxY: 50000,
    lineBarsData: [
      LineChartBarData(
        spots: list
            .map((point) => FlSpot((point.x).toDouble(), point.y.toDouble()))
            .toList()
          ..sort(((a, b) => a.x.compareTo(b.x))),
        isCurved: true,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
        barWidth: 0,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(1)).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontSize: 11,
  );
  Widget text;
  switch (value.toInt()) {
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

// Widget leftTitleWidgets(double value, TitleMeta meta) {
//   const style = TextStyle(
//     color: Color(0xff67727d),
//     fontWeight: FontWeight.bold,
//     fontSize: 15,
//   );
//   String text;
//   switch (value.toInt()) {
//     case 1:
//       text = '10K';
//       break;
//     case 3:
//       text = '30k';
//       break;
//     case 5:
//       text = '50k';
//       break;
//     default:
//       return Container();
//   }

//   return Text(text, style: style, textAlign: TextAlign.left);
// }