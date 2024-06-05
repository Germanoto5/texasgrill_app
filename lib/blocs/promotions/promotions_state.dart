part of 'promotions_bloc.dart';

@immutable
sealed class PromotionsState {}

final class InitialPromotionsState extends PromotionsState {}

final class LoadingPromotionsState extends PromotionsState{}

final class LoadedPromotionsState extends PromotionsState{}

class ErrorPromotionsState extends PromotionsState {
  final int statusCode;
  final String  message;

  ErrorPromotionsState({required this.statusCode, required this.message});
}
