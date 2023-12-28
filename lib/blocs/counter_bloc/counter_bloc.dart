import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterDecrementEvent>(_onCounterDecrement);
    on<CounterIncrementEvent>(_onCounterIncrement);
  }

  void _onCounterDecrement(
    CounterDecrementEvent event,
    Emitter<CounterState> emit,
  ) =>
      emit(DecrementState(state.counterValue - 1));

  void _onCounterIncrement(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) =>
      emit(IncrementState(state.counterValue + 1));
}
