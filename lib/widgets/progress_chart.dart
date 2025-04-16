import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flexcorex/themes/colors.dart';

class ProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 10, top: 10, bottom: 0),
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    rod.toY.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                ],
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    Widget text;
                    switch (value.toInt()) {
                      case 0:
                        text = const Text('Mon', style: style);
                        break;
                      case 2:
                        text = const Text('Wed', style: style);
                        break;
                      case 4:
                        text = const Text('Fri', style: style);
                        break;
                      case 6:
                        text = const Text('Sun', style: style);
                        break;
                      default:
                        text = const Text('', style: style);
                        break;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 16,
                      child: text,
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: showingGroups(),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
}

List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
      switch (i) {
        case 0:
          return makeGroupData(0, 70, barColor: AppColors.deepTeal);
        case 1:
          return makeGroupData(1, 75, barColor: AppColors.deepTeal);
        case 2:
          return makeGroupData(2, 60, barColor: AppColors.deepTeal);
        case 3:
          return makeGroupData(3, 80, barColor: AppColors.deepTeal);
        case 4:
          return makeGroupData(4, 72, barColor: AppColors.deepTeal);
        case 5:
          return makeGroupData(5, 90, barColor: AppColors.deepTeal);
        case 6:
          return makeGroupData(6, 85, barColor: AppColors.deepTeal);
        default:
          return throw Error();
      }
    });

BarChartGroupData makeGroupData(
  int x,
  double y, {
  Color barColor = Colors.white,
  double width = 22,
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        color: barColor,
        width: width,
        borderRadius: BorderRadius.circular(5),
      ),
    ],
    showingTooltipIndicators: [0],
  );
}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
