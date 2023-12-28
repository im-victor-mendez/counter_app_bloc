import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(_onCounterIncrement);
    on<CounterDecrementEvent>(_onCounterDecrement);
  }

  void _onCounterDecrement(
    CounterDecrementEvent event,
    Emitter<CounterState> emit,
  ) =>
      emit(CounterState(counterValue: state.counterValue - 1));

  void _onCounterIncrement(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) =>
      emit(CounterState(counterValue: state.counterValue + 1));
}
