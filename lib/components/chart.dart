import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent extends StatelessWidget {
  var grdientColors = [
    Color.fromARGB(144, 245, 159, 110),
    Color.fromARGB(173, 255, 145, 2),
    Color.fromARGB(109, 126, 68, 116),
    Color.fromARGB(143, 189, 60, 135),
    Color.fromARGB(143, 175, 39, 96),
    Color.fromARGB(133, 152, 33, 168),
    Color.fromARGB(185, 255, 0, 234),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Text('Your'),
        Container(
        height: 260,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        padding: EdgeInsets.only(top: 100, bottom: 50, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: LineChart(
          LineChartData(
            minX: 39,
            maxX: 120,
            minY: 1.4,
            maxY: 2,
            titlesData: LineTitles.getTitleData(),
            borderData: FlBorderData(
              show: false,
            ),
            gridData: FlGridData(
              show: true,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(41.625, 1.5),
                  FlSpot(47.36, 1.6),
                  FlSpot(71.961, 1.7),
                  FlSpot(81, 1.8),
                  FlSpot(107.939, 1.9),
                  FlSpot(120, 2),
                ],
                dotData: FlDotData(show: false),
                isStrokeCapRound: true,
                colors: grdientColors,
                barWidth: 3,
              ),
            ],
          ),
        ),
      ),
      ], 
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: false,
          getTitles: (value) {
            if (value < 41.625) {
              return 'underweight';
            } else if (value >= 41.625 && value < 47.36) {
              return 'normal';
            } else if (value >= 81 && value < 107.939) {
              return 'overweight';
            } else {
              return 'obese';
            }
          },
          margin: 8,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(showTitles: false),
      );
}
