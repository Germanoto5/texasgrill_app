import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'promotions_event.dart';
part 'promotions_state.dart';

class PromotionsBloc extends Bloc<PromotionsEvent, PromotionsState> {
  PromotionsBloc() : super(InitialPromotionsState()) {
    on<PromotionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
