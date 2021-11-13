import 'package:frontend/bloc/charts_bloc.dart';
import 'package:frontend/main.dart';
import 'package:frontend/repository/chart_repository.dart';

Future<void> chartsFeatureDI() async {
  di.registerFactory(() => ChartRepository());
  di.registerFactory(() => ChartListBloc(di()));
}
