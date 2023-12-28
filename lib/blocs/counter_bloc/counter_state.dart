part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;

  CounterState({required this.counterValue});

  @override
  List<Object?> get props => [counterValue];
}

final class CounterInitial extends CounterState {
  CounterInitial({super.counterValue = 0});
}
