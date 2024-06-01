part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class LogingUserEvent extends LoginEvent{
  final Login login;

  LogingUserEvent({required this.login});


   }

class SetUserEvent extends LoginEvent{
  final User user;
  final Token token;

  SetUserEvent({required this.user, required this.token});

}

class LogoutUserEvent extends LoginEvent{}

class LoginTokenExpiredEvent extends LoginEvent{}
