part of 'redeem_promotions_bloc.dart';

sealed class RedeemPromotionsState extends Equatable {
  const RedeemPromotionsState();
  
  @override
  List<Object> get props => [];
}

final class InnitialRedeemPromotionsState extends RedeemPromotionsState {}

class LoadingRedeemPromotionsState extends RedeemPromotionsState{}

class LoadedRedeemPromotionsState  extends RedeemPromotionsState {}

class ErrorRedeemPromotionsState  extends RedeemPromotionsState {
  final int statusCode;
  final String  message;

  const ErrorRedeemPromotionsState({required this.statusCode, required this.message});

}

