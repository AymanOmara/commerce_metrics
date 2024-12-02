import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../display/order_chart_display.dart';

class OrderLineChartPage extends StatelessWidget {
  final OrderChartDisplay chartDisplay;

  const OrderLineChartPage({super.key, required this.chartDisplay});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> graphData = chartDisplay.generateGraphData();
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: true),
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int index = value.toInt();
                    if (index < graphData.length) {
                      String yearMonth =
                          chartDisplay.orderCountMap().keys.elementAt(index);
                      return Text(yearMonth);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            borderData: FlBorderData(
                show: true, border: Border.all(color: Colors.black, width: 1)),
            minX: 0,
            maxX: graphData.length.toDouble() - 1,
            minY: 0,
            maxY: graphData.isNotEmpty
                ? graphData
                    .map((spot) => spot.y)
                    .reduce((a, b) => a > b ? a : b)
                : 1,
            lineBarsData: [
              LineChartBarData(
                spots: graphData,
                isCurved: true,
                color: gradientColors.first,
                barWidth: 4,
                belowBarData: BarAreaData(
                    show: true, color: Colors.blue.withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
