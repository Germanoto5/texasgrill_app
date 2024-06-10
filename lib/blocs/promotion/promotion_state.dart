part of 'promotion_bloc.dart';

sealed class PromotionState extends Equatable {
  const PromotionState();
  
  @override
  List<Object> get props => [];
}

final class InitialPromotionState extends PromotionState {}

final class LoadingPromotionState extends PromotionState{}

final class LoadedPromotionState extends PromotionState{
  final Promotion promotion;

  const LoadedPromotionState({required this.promotion});
}

class ErrorPromotionState extends PromotionState {
  final int statusCode;
  final String  message;

  const ErrorPromotionState({required this.statusCode, required this.message});
}