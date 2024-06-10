
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/blocs/countdown/countdown_bloc.dart';
import 'package:texasgrill_app/models/promotion.dart';

part 'redeem_promotions_event.dart';
part 'redeem_promotions_state.dart';

class RedeemPromotionsBloc
    extends Bloc<RedeemPromotionsEvent, RedeemPromotionsState> {
  Map<Promotion, CountDownBloc>? redeemPromotion;
  RedeemPromotionsBloc() : super(InnitialRedeemPromotionsState()) {
    on<LoadRedeemPromotionsEvent>((event, emit) async {
      emit(LoadingRedeemPromotionsState());
      Response? response = await request.redeemPromotion(event.idPromotion);
      if (response != null) {
        
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(LoadedRedeemPromotionsState());
        } else {
          emit(ErrorRedeemPromotionsState(
              statusCode: response.statusCode, message: response.body));
        }
      } else {
        emit(const ErrorRedeemPromotionsState(
            statusCode: 0,
            message:
                "No se pudo obtener la información. Inténtalo de nuevo más tarde."));
      }
    });
  }
}
