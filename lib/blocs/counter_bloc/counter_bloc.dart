import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
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

  @override
  CounterState? fromJson(Map<String, dynamic> json) =>
      CounterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toMap();
}
