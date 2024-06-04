part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class InitalProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<ProductMenu> products;

  LoadedProductState({required this.products});
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final int statusCode;
  final String  message;

  ErrorProductState({required this.statusCode, required this.message});
}

