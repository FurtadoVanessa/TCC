import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/charts_bloc.dart';
import 'package:frontend/bloc/charts_event.dart';
import 'package:frontend/bloc/charts_state.dart';
import 'package:frontend/charts/line_charts/spline_chart.dart';
import 'package:frontend/main.dart';
import 'charts/circular_charts/doughnut_chart.dart';
import 'charts/circular_charts/pie_chart.dart';

class MonitorController extends StatefulWidget {
  final bool animate;

  MonitorController({required this.animate});

  _SimpleBarChart createState() => _SimpleBarChart();

  factory MonitorController.withSampleData() {
    return new MonitorController(animate: false);
  }
}

class _SimpleBarChart extends State<MonitorController> {
  ChartListBloc bloc = di();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => bloc..add(GetInterversEvent()),
        child: BlocBuilder<ChartListBloc, ChartsListState>(
          builder: (context, state) {
            if (state is Loaded) {
              return loadedState();
            }
            if (state is Loading) {
              return loadingState();
            }
            if (state is Error) {
              return emptyState(state.message);
            }
            return emptyState("Deu ruim");
          },
        ),
      ),
    ));
  }

  loadedState() {
    new Column(
      children: <Widget>[
        new SizedBox(
          height: 250,
          child: PieChartController.withSampleData(),
        ),
        new SizedBox(
          height: 250,
          child: DoughnutChartController.withSampleData(),
        ),
        new SizedBox(
          height: 250,
          child: SplineChartController.withSampleData(),
        )
      ],
    );
  }

  emptyState(String message) {
    return Text(message);
  }

  loadingState() {
    return CircularProgressIndicator();
  }
}
