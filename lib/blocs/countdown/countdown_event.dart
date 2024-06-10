part of 'countdown_bloc.dart';

sealed class CountDownEvent extends Equatable {
  const CountDownEvent();

  @override
  List<Object> get props => [];
}


class StartCountdown extends CountDownEvent {
  final int initialTime;
  const StartCountdown({required this.initialTime});
}
class Tick extends CountDownEvent {}