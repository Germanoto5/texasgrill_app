import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/api/response.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:texasgrill_app/models/promotion.dart';

part 'promotions_event.dart';
part 'promotions_state.dart';

class PromotionsBloc extends Bloc<PromotionsEvent, PromotionsState> {
  PromotionsBloc() : super(InitialPromotionsState()) {
    on<LoadPromotionsEvent>((event, emit) async{
      emit(LoadingPromotionsState());
      Response? response = await request.getPromotions((loginBloc.state as LogedState).user.correo!);
      if(response != null){
        if(response.statusCode == 200 || response.statusCode == 201){
        final decodedResponse = utf8.decode(response.bodyBytes);
        Map<String, dynamic> data = jsonDecode(decodedResponse);
          ListPromotionRes promotionsRes = ListPromotionRes.fromJson(data);
          emit(LoadedPromotionsState(promotions: promotionsRes.data!));
        }else if(response.statusCode == 401 ){
          loginBloc.add(LoginTokenExpiredEvent());
        }else{
          emit(ErrorPromotionsState(statusCode: response.statusCode, message: response.body));
        }
      }else{
        emit(ErrorPromotionsState(statusCode: 0 , message: "No se pudo obtener la información. Inténtalo de nuevo más tarde."));
      }
    });
  }
}
PromotionsBloc promotionsBloc = PromotionsBloc();