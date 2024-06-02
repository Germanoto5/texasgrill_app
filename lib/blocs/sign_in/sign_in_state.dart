part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

class SignInSuccesState extends SignInState{}

class SignInErrorState extends SignInState{
  
  final int statusCode;
  final String  message;

  const SignInErrorState({required this.statusCode, required this.message});
}

class SigningInState extends SignInState{}

