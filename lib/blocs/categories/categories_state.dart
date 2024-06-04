part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

final class InitialCategoriesState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState{
  final List<CategoryMenu> categories;

  const LoadedCategoriesState({required this.categories});
}

class LoadingCategoriesState extends CategoriesState{}

class ErrorCategoriesState extends CategoriesState{
  final int statusCode;
  final String  message;

  const ErrorCategoriesState({required this.statusCode, required this.message});
}
