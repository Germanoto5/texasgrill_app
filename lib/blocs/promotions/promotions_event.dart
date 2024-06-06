part of 'promotions_bloc.dart';

@immutable
sealed class PromotionsEvent {}

class LoadPromotionsEvent extends PromotionsEvent {}
