import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'circular_chart_view_model.dart';

class DoughnutChartController extends StatefulWidget {
  final bool animate;
  final List<CircularChartViewModel> data;

  DoughnutChartController({required this.animate, required this.data});

  _DoughnutChart createState() => _DoughnutChart();

  factory DoughnutChartController.withSampleData() {
    return new DoughnutChartController(animate: false, data: _sampleData());
  }

  static List<CircularChartViewModel> _sampleData() {
    List<CircularChartViewModel> data = <CircularChartViewModel>[
      CircularChartViewModel('Jan', 35),
      CircularChartViewModel('Feb', 28),
      CircularChartViewModel('Mar', 34),
      CircularChartViewModel('Apr', 32),
      CircularChartViewModel('May', 40)
    ];
    return data;
  }
}

class _DoughnutChart extends State<DoughnutChartController> {
  @override
  Widget build(BuildContext context) {
    return new SfCircularChart(
        // Chart title
        title: ChartTitle(text: 'Half yearly sales analysis'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: _getSemiDoughnutSeries());
  }

  List<DoughnutSeries<CircularChartViewModel, String>>
      _getSemiDoughnutSeries() {
    return <DoughnutSeries<CircularChartViewModel, String>>[
      DoughnutSeries<CircularChartViewModel, String>(
          dataSource: widget.data,
          innerRadius: '50%',
          radius: '100%',
          startAngle: 270,
          endAngle: 90,
          xValueMapper: (CircularChartViewModel data, _) => data.title,
          yValueMapper: (CircularChartViewModel data, _) => data.value,
          dataLabelSettings: const DataLabelSettings(
              isVisible: true, labelPosition: ChartDataLabelPosition.outside))
    ];
  }
}

class ChartSampleData {
  String x;
  int y;
  String text;
  ChartSampleData({required this.x, required this.y, required this.text});
}
