import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:parichay/data/app_exceptions.dart';
import 'package:parichay/data/network/BaseApiServices.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      }).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data, headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      }).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }
    switch (response.statusCode) {
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}

// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:parichay/data/app_exceptions.dart';
// import 'package:parichay/data/network/BaseApiServices.dart';
//
// class NetworkApiService extends BaseApiServices {
//   @override
//   Future getApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response =
//       await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection...');
//     }
//     return responseJson;
//   }
//
//   @override
//   Future<void> getpostApiResponse(String url, dynamic data) async {
//     print('network api calling....');
//     print(data);
//     print('network api calling....$data');
//     dynamic responseJson;
//     try {
//       Response response = await http
//           .post(Uri.parse(url), body: data)
//           .timeout(Duration(seconds: 10));
//
//       responseJson = returnResponse(response);
//       print('responseJson $responseJson');
//       print('response $response');
//     }  catch(e) {
//       print('Error fetching data: $e');
//     }
//     return responseJson;
//   }
//
//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 404:
//         throw UnauthorizedException(response.body.toString());
//       default:
//         throw FetchDataException(
//             'Error ocured while communicating with server' +
//                 'with status code' +
//                 response.statusCode.toString());
//     }
//   }
// }
