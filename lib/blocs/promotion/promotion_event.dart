part of 'promotion_bloc.dart';

sealed class PromotionEvent extends Equatable {
  const PromotionEvent();

  @override
  List<Object> get props => [];
}

final class LoadPromotionEvent extends PromotionEvent{
  final int idPromotion;

  const LoadPromotionEvent({required this.idPromotion});
}
