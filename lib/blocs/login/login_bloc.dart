import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:texasgrill_app/api/authentication_request.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/models/login.dart';
import 'package:texasgrill_app/models/token.dart';
import 'package:texasgrill_app/models/user.dart';
import 'package:texasgrill_app/utils/secure_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  LoginBloc() : super(LogoutState()) {
    on<LogingUserEvent>((event, emit) async {
      emit(LogingState());
      String bodyPet = jsonEncode(event.login.toJson());
      Response? res = await authenticationRequest.login(bodyPet);
      if (res != null) {
        if (res.statusCode == 200 || res.statusCode == 201) {
          Map<String, dynamic> data = jsonDecode(res.body);
          if (data.containsKey("token")) {
            secureStorage.setString("token", data["token"]);
            secureStorage.setString("email", event.login.correo);
            User user = User();
            Response? response = await request.getAboutMe();
            
            if(response != null && response.statusCode == 200){
              final decodedResponse = utf8.decode(response.bodyBytes);
              Map<String, dynamic> dataUser = jsonDecode(decodedResponse);
              user = User.fromJson(dataUser);
            }
            user.correo = event.login.correo;
            add(SetUserEvent(token: Token.fromJson(data), user: user));
          }
        }else if(res.statusCode == 401){
          emit(LoginErrorState(statusCode: res.statusCode, message: jsonDecode(res.body)["message"]));
        }
      }
      emit(LoginErrorState(statusCode: 1, message: 'No hay conexión en este momento'));
    });
    on<SetUserEvent>((event, emit) async {
      emit(LogedState(token: event.token, user: event.user));
    });
    on<LogoutUserEvent>((event, emit) async {
      if (await secureStorage.containKey("token")) {
        secureStorage.deleteKey("token");
      }
      if (await secureStorage.containKey("email")) {
        secureStorage.deleteKey("email");
      }
      emit(LogoutState());
    });
    on<LoginTokenExpiredEvent>((event, emit) async {
      emit(LoginTokenExpiredState());
    });
  }

  void _loginUser(String tokenString, String email) {
    Token token = Token();
    token.token = tokenString;
    User user = User();
    user.correo = email;
    add(SetUserEvent(user: user, token: token));
  }

  Future<void> initLogin() async {
    String? token = await _getLoginToken();
    loginBloc = LoginBloc();
    if (token != null) {
      String? email = await _getLoginEmail();
      loginBloc._loginUser(token, email!);
    }
  }

  Future<String?> _getLoginToken() async {
    if (await secureStorage.containKey("token")) {
      return secureStorage.getString("token");
    }
    return null;
  }

  Future<String?> _getLoginEmail() async {
    if (await secureStorage.containKey("email")) {
      return secureStorage.getString("email");
    }
    return null;
  }
}
LoginBloc loginBloc = LoginBloc();
