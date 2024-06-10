import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:texasgrill_app/api/authentication_request.dart';
import 'package:texasgrill_app/models/user.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInProcessEvent>((event, emit) async{
      emit(SigningInState());
      Response? response = await authenticationRequest.register(jsonEncode(event.user.toJson()));
      if(response!= null){
        if(response.statusCode == 201){
          emit(SignInSuccesState());
        }else{
          emit(SignInErrorState(statusCode: response.statusCode, message: jsonDecode(response.body)["message"]));
        }
      }else{
        emit(const SignInErrorState(statusCode: 1, message: "No conexion error"));
      }
    });
  }
}
