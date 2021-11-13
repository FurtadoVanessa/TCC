import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'circular_chart_view_model.dart';

class PieChartController extends StatefulWidget {
  final bool animate;
  final List<CircularChartViewModel> data;

  PieChartController({required this.animate, required this.data});

  _PieChart createState() => _PieChart();

  factory PieChartController.withSampleData() {
    return new PieChartController(animate: false, data: _sampleData());
  }

  static List<CircularChartViewModel> _sampleData() {
    List<CircularChartViewModel> data = [
      CircularChartViewModel('Jan', 35),
      CircularChartViewModel('Feb', 28),
      CircularChartViewModel('Mar', 34),
      CircularChartViewModel('Apr', 32),
      CircularChartViewModel('May', 40)
    ];
    return data;
  }
}

class _PieChart extends State<PieChartController> {
  @override
  Widget build(BuildContext context) {
    return new SfCircularChart(
      // Chart title
      title: ChartTitle(text: 'Half yearly sales analysis'),
      // Enable legend
      legend: Legend(isVisible: true),
      // Enable tooltip
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <PieSeries<CircularChartViewModel, String>>[
        PieSeries<CircularChartViewModel, String>(
            explode: true,
            explodeIndex: 2,
            dataSource: widget.data,
            xValueMapper: (CircularChartViewModel data, _) => data.title,
            yValueMapper: (CircularChartViewModel data, _) => data.value,
            dataLabelSettings: DataLabelSettings(isVisible: true)),
      ],
    );
  }
}
