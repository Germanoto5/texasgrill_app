import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

class AuthenticationRequest{
  String url = "http://192.168.1.14:3030/tga/common/api/user";

  Future<Response?> login(String user) async {
    return await _call(
        method: 'POST', url: "$url/login", bodyJson: user);
  }

  Future<Response?> register(String user) async {
    return await _call(
        method: 'POST',
        url: "$url/register",
        bodyJson: user);
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
    return headers;
  }
}

AuthenticationRequest authenticationRequest = AuthenticationRequest();