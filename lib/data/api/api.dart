import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:http/io_client.dart';

//String userToken = ReduxHome.store.state.postsState.userLoginModel.responseData.token;

class API {
  API();

  static const String URL = "https://pokeapi.co/api/v2";

  static const String INITIAL_URL = "/pokemon";

  Future<MyHttpResponse> getListPokemon() async {
    var url = Uri.parse(URL + INITIAL_URL);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    } catch (e) {
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }
}

Future<MyHttpResponse> getRequest(Uri uri) async {
  var response = await http.get(uri);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int? statusCode;
  String? message;
  dynamic? data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
