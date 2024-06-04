part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class LoadProductEvent extends ProductEvent{
  final CategoryMenu category;

  LoadProductEvent({required this.category});
}