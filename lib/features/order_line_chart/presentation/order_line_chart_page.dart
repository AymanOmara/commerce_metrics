import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../display/order_chart_display.dart';

class OrderLineChartPage extends StatelessWidget {
  final OrderChartDisplay chartDisplay;

  const OrderLineChartPage({
    super.key,
    required this.chartDisplay,
  });

  @override
  Widget build(BuildContext context) {
    List<FlSpot> graphData = chartDisplay.generateGraphData();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: true,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: 1,
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index <
                              chartDisplay.orderCountMap().keys.length) {
                            String yearMonth = chartDisplay
                                .orderCountMap()
                                .keys
                                .elementAt(index)
                                .replaceAll("20", "");
                            return Text(
                              yearMonth,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
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
                      barWidth: 4,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
