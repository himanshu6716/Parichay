import 'package:parichay/data/network/BaseApiServices.dart';
import 'package:parichay/data/network/NetworkApiResponse.dart';
import 'package:parichay/res/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
