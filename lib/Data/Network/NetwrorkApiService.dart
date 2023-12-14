import 'dart:convert';

import 'dart:io';

import 'package:authenticationproject/Data/Network/BaseApiService.dart';
import 'package:authenticationproject/Utils/Utils.dart';

import '../App_Exceptions/App_Exceptions.dart';
import 'package:http/http.dart' as http;


class NetworkApiService implements BaseApiService {
  @override
  Future GetgetApiService(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
         const Duration(seconds: 10));


      responseJson= ReturnResponse(response);

    }
    on SocketException {
      FetchDataException('No internet Connection');
    }
    return responseJson;
  }

  @override
  Future GetPostApiSercice(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
          Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));


      responseJson= ReturnResponse(response);

    }
    on SocketException {
      FetchDataException('No internet Connection');
    }
    return responseJson;
  }


  // dynamic ReturnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //
  //     default:
  //       throw FetchDataException('error during communicating with server');
  //   }
  // }
  dynamic ReturnResponse(http.Response response) {
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException('User not found');
      case 404:
        throw FetchDataException(response.body);
      default:
        throw FetchDataException(response.body);
    }
  }

}