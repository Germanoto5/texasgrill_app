part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInProcessEvent extends SignInEvent{
  final User user;

  const SignInProcessEvent({required this.user});
}
