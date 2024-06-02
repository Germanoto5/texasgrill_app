import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/api/response.dart';
import 'package:texasgrill_app/models/category_menu.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  List<CategoryMenu>? categories;
  CategoriesBloc() : super(CategoriesInitial()) {
    on<LoadCategoriesEvent>((event, emit) async{
      emit(LoadingCategoriesState());
      Response? response = await request.getCategorias();
      if(response != null){
        final decodedResponse = utf8.decode(response.bodyBytes);
        Map<String, dynamic> data = jsonDecode(decodedResponse);
        if(response.statusCode == 200 || response.statusCode == 201){
          ListCategoriesRes categoriesRes = ListCategoriesRes.fromJson(data);
          categories = categoriesRes.data;
          emit(LoadedCategoriesState(categories: categories!));
        }else{
          emit(ErrorCategoriesState());
        }
      }else{
        emit(ErrorCategoriesState());
      }
    });
  }
}
