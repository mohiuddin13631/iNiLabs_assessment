

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  // final dio = Dio();

  @override
  Future<dynamic> getApi(String url)async{

    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson ;
    try {
      final response = await Dio().get(url);
      responseJson  = returnResponse(response) ;
    }on SocketException {
      throw InternetException('');
    }on RequestTimeOut {
      throw RequestTimeOut('');

    }
    print(responseJson);
    return responseJson ;
  }

  dynamic returnResponse(dynamic response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = response.data;
        return responseJson ;
      case 400:
        dynamic responseJson = jsonDecode(response.data);
        return responseJson ;

      default :
        throw FetchDataException('Error accoured while communicating with server '+response.statusCode.toString()) ;
    }
  }

  @override
  Future postApi(data, String url) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

}