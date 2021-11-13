import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'line_chart_view_model.dart';

class SplineChartController extends StatefulWidget {
  final bool animate;
  final List<LineChartViewModel> data;
  final String name;

  SplineChartController(
      {required this.animate, required this.data, required this.name});

  _SplineChart createState() => _SplineChart();

  factory SplineChartController.withSampleData() {
    return new SplineChartController(
        animate: false, data: _sampleData(), name: "Produção dos Inversores");
  }

  static List<LineChartViewModel> _sampleData() {
    List<LineChartViewModel> data = [
      LineChartViewModel('Inversor 1', [
        LineChartPointViewModel(1, 2),
        LineChartPointViewModel(2, 5),
        LineChartPointViewModel(3, 9),
        LineChartPointViewModel(4, 20)
      ]),
      LineChartViewModel('Inversor 2', [
        LineChartPointViewModel(1, 6),
        LineChartPointViewModel(2, 15),
        LineChartPointViewModel(3, 19),
        LineChartPointViewModel(4, 30)
      ]),
    ];
    return data;
  }
}

class _SplineChart extends State<SplineChartController> {
  @override
  Widget build(BuildContext context) {
    return new SfCartesianChart(
      title: ChartTitle(text: widget.name),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getSeries(),
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: _getMinimunY(),
          maximum: _getMaximumY(),
          axisLine: const AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorTickLines: const MajorTickLines(size: 0)),
    );
  }

  List<SplineSeries<LineChartPointViewModel, String>>? _getSeries() {
    List<SplineSeries<LineChartPointViewModel, String>> data =
        <SplineSeries<LineChartPointViewModel, String>>[];

    for (var line in widget.data) {
      data.add(SplineSeries<LineChartPointViewModel, String>(
        dataSource: line.points,
        xValueMapper: (LineChartPointViewModel point, _) => point.x.toString(),
        yValueMapper: (LineChartPointViewModel point, _) => point.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: line.lineTitle,
      ));
    }
    return data;
  }

  double _getMinimunY() {
    var yValues = _getYValues();

    if (yValues.length > 0) {
      return yValues.reduce((current, next) => current < next ? current : next);
    }
    return 0;
  }

  double _getMaximumY() {
    var yValues = _getYValues();

    if (yValues.length > 0) {
      return yValues.reduce((current, next) => current > next ? current : next);
    }
    return 0;
  }

  List<double> _getYValues() {
    var yValues = <double>[];

    for (var line in widget.data) {
      line.points.forEach((element) {
        yValues.add(element.y);
      });
    }
    return yValues;
  }
}
