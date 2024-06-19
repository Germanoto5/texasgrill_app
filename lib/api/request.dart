import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:texasgrill_app/utils/secure_storage.dart';

class Request {
  String url = "http://192.168.184.27:3030/tga/api";


  Future<Response?> getAboutMe() async {
    return await _call(
        method: 'GET', url: "$url/me");
  }

  Future<Response?> getCategorias() async {
    return await _call(
        method: 'GET', url: "$url/categorias");
  }

  Future<Response?> getProductosByCategorias(int idCategoria) async {
    return await _call(
        method: 'GET',
        url: "$url/productos/categoria/$idCategoria");
  }

  Future<Response?> getPromotions(String correo) async {
    return await _call(
        method: 'GET',
        url: "$url/ofertas/$correo");
  }
  Future<Response?> getPromotion(int id) async {
    return await _call(
        method: 'GET',
        url: "$url/oferta/$id");
  }
  
   Future<Response?> redeemPromotion(int idPromotion) async {
    return await _call(
        method: 'GET',
        url: "$url/redeem/$idPromotion",);
  }

  Future<Response?> _call(
      {required String method, required String url, String? bodyJson}) async {
    Response? response;

    try {
      if (method == 'GET') {
      response = await get(
        Uri.parse(url),
        headers: await _getHeaders(),
      ).timeout(const Duration(seconds: 8));
    } else if (method == 'POST') {
      response = await post(Uri.parse(url),
          headers: await _getHeaders(), 
          body: bodyJson);
    }
    } on ClientException catch (e) {
      print('Client exception: $e');
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      print('Other exception: $e');
    }
    
    return response;
  }

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> headers = {};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    headers[HttpHeaders.authorizationHeader] = "Bearer ${await secureStorage.getString("token")}";
    return headers;
  }
}

Request request = Request();
