import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/data_model.dart';

@immutable
abstract class ChartsListState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ChartsListState {}

class Loading extends ChartsListState {}

class Loaded extends ChartsListState {
  final List<BuildingData> data;

  Loaded({required this.data});

  @override
  List<Object> get props => [data];
}

class Error extends ChartsListState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
