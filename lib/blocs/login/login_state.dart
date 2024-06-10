part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogedState extends LoginState{
  final Token token;
  final User user;

  LogedState({required this.token, required this.user});

  LogedState copyWith({Token? token, User? user}) {
    return LogedState(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }
}

class LogoutState extends LoginState{}

class LogingState extends LoginState{}

class LoginErrorState extends LoginState{
  final int statusCode;
  final String  message;

  LoginErrorState({required this.statusCode, required this.message});
}

class LoginTokenExpiredState extends LoginState{}

