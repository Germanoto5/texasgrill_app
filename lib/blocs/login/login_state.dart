part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogedState extends LoginState{
  final Token token;
  final User user;

  LogedState({required this.token, required this.user});
}

class LogoutState extends LoginState{}

class LogingState extends LoginState{}

class LoginErrorState extends LoginState{}

class LoginTokenExpiredState extends LoginState{}

