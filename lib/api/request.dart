import 'dart:io';

import 'package:http/http.dart';

class Request {
  String url ="http://172.27.160.1:8080";
  

  Future<Response?> login(String user) async {
    return await _call(method: 'POST', url: "$url/tga/common/api/user/login", bodyJson: user);
  }
  Future<Response?> register(String user) async {
    return await _call(method: 'POST', url: "$url/tga/common/api/user/register", bodyJson: user);
  }

  Future<Response?> _call({
      required String method, required String url, String? bodyJson}) async {
    Response? response;
    
    if (method == 'GET') {
      response = await get(
        Uri.parse(url),
        headers: await _getHeaders(),
      );
    } else if (method == 'POST') {
      response = await post(Uri.parse(url),
          headers: await _getHeaders(), body: bodyJson);
    }
    return response;
  }

  Future<Map<String, String>> _getHeaders() async {
    Map<String, String> headers = {};
    headers[HttpHeaders.acceptHeader] = 'application/json';
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    /*if(loginBloc.state is LogedState){
       headers[HttpHeaders.authorizationHeader] = "Bearer ${(loginBloc.state as LogedState).token.accessToken!}"; //(await secureStorage.getString("token"))!;
    }*/
    return headers;
  }
}

Request request = Request();