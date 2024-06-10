part of 'redeem_promotions_bloc.dart';

sealed class RedeemPromotionsEvent extends Equatable {
  const RedeemPromotionsEvent();

  @override
  List<Object> get props => [];
}

class LoadRedeemPromotionsEvent extends RedeemPromotionsEvent{
  final int idPromotion;

  const LoadRedeemPromotionsEvent({required this.idPromotion});
  
}

class PutRedeemPromotionsEvent extends RedeemPromotionsEvent{
  final Promotion promotion;

  const PutRedeemPromotionsEvent({required this.promotion});
}


