import 'package:frontend/bloc/charts_event.dart';
import 'package:frontend/bloc/charts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/repository/chart_repository.dart';

class ChartListBloc extends Bloc<ChartsListEvent, ChartsListState> {
  ChartRepository chartRepository;

  ChartListBloc(this.chartRepository) : super(Empty());

  @override
  Stream<ChartsListState> mapEventToState(ChartsListEvent event) async* {
    try {
      yield Loading();
      if (event is GetInterversEvent) {
        yield Loaded(data: await chartRepository.getAllInverters());
      }
    } catch (e) {
      yield Error(message: "Deu ruim");
    }
  }
}
