import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountDownBloc extends Bloc<CountDownEvent, CountDownState> {
  Timer? _timer;
  int _start; // 15 minutos en segundos

  CountDownBloc({int start = 15 * 60}) 
      : _start = start, 
        super(CountDownState(start)) {
    on<StartCountdown>(_onStartCountdown);
    on<Tick>(_onTick);
  }

  void _onStartCountdown(StartCountdown event, Emitter<CountDownState> emit) {
    if (_timer != null && _timer!.isActive) return; // Evitar múltiples timers
    _start = event.initialTime; // Ajustar el tiempo inicial basado en el evento
    emit(CountDownState(_start)); // Emitir el nuevo estado inicial

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(Tick());
    });
  }

  void _onTick(Tick event, Emitter<CountDownState> emit) {
    if (state.remainingTime == 0) {
      _timer?.cancel();
    } else {
      emit(CountDownState(state.remainingTime - 1));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
