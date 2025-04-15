import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 80),
                FlSpot(1, 79),
                FlSpot(2, 78),
                FlSpot(3, 77),
                FlSpot(4, 76),
                FlSpot(5, 75),
              ],
              isCurved: true,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
