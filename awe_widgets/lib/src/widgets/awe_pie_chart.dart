import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum PieChartType {
  animated,
  normal,
}

class AWEPieChart extends StatelessWidget {
  final PieChartType type;
  final Map<String, double> dataMap;
  final String? centerText;

  const AWEPieChart(
    this.type, {
    required this.dataMap,
    this.centerText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      centerText: centerText,
      animationDuration: Duration(
        milliseconds: type.millisecondsDuration,
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValuesOutside: false,
        decimalPlaces: 2,
      ),
    );
  }
}

extension _Styles on PieChartType {
  int get millisecondsDuration {
    switch (this) {
      case PieChartType.animated:
        return 300;
      case PieChartType.normal:
        return 0;
    }
  }
}
