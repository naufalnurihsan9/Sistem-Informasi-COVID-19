import 'package:equatable/equatable.dart';

abstract class ChartEvents extends Equatable {
  const ChartEvents();

  @override
  List<Object> get props => [];
}

class StartEvent extends ChartEvents {}
