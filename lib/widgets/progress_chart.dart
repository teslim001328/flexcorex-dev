import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flexcorex/themes/colors.dart';

class ProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 20, bottom: 10),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 100,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 70),
                  FlSpot(1, 75),
                  FlSpot(2, 60),
                  FlSpot(3, 80),
                  FlSpot(4, 72),
                  FlSpot(5, 90),
                  FlSpot(6, 85),
                ],
                isCurved: true,
                gradient: LinearGradient(
                  colors: [
                    AppColors.deepTeal.withOpacity(0.5),
                    AppColors.darkEmeraldGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.deepTeal.withOpacity(0.2),
                      AppColors.darkEmeraldGreen.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
