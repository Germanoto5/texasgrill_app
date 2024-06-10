import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:texasgrill_app/api/request.dart';
import 'package:texasgrill_app/api/response.dart';
import 'package:texasgrill_app/blocs/login/login_bloc.dart';
import 'package:texasgrill_app/models/category_menu.dart';
import 'package:texasgrill_app/models/product_menu.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(InitalProductState()) {
    on<LoadProductEvent>((event, emit) async{
      emit(LoadingProductState());
      Response? response = await request.getProductosByCategorias(event.category.id!);
      if(response != null){
        final decodedResponse = utf8.decode(response.bodyBytes);
        Map<String, dynamic> data = jsonDecode(decodedResponse);
        if(response.statusCode == 200){
          ListProductsRes listRes = ListProductsRes.fromJson(data);
          emit(LoadedProductState(products: listRes.data!));
        }else if(response.statusCode == 401){
          loginBloc.add(LoginTokenExpiredEvent());
        }else{
          emit(ErrorProductState(statusCode: response.statusCode, message: data["message"]));
        }

      }else{
        emit(ErrorProductState(statusCode: 0, message: "No se pudo obtener la información. Inténtalo de nuevo más tarde."));
      }
    });
  }
}
