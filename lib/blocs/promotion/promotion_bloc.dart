import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:texasgrill_app/models/promotion.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  PromotionBloc() : super(InitialPromotionState()) {
    on<LoadPromotionEvent>((event, emit) async {
      emit(LoadingPromotionState());
       Response? response = await request.getPromotion(event.idPromotion);
      if(response != null){
        if(response.statusCode == 200 || response.statusCode == 201){
          
        final decodedResponse = utf8.decode(response.bodyBytes);
        Map<String, dynamic> data = jsonDecode(decodedResponse);
          Promotion promotionsRes = Promotion.fromJson(data);
          emit(LoadedPromotionState(promotion: promotionsRes));
        }else if(response.statusCode == 401){
          loginBloc.add(LoginTokenExpiredEvent());
        }else{
          emit(ErrorPromotionState(statusCode: response.statusCode, message: response.body));
        }
      }else{
        emit(const ErrorPromotionState(statusCode: 0 , message: "No se pudo obtener la información. Inténtalo de nuevo más tarde."));
      }
    });
  }
}
