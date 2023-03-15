import 'dart:convert';

import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:http/http.dart';

import '../models/api_base_mode.dart';

class UserService {
  final WebApiDataService _webApiService = WebApiDataService();

  Future<String> createAccount(Map<String, dynamic> userPersonalDetails) async {
    //var key = await _storage.read(key: clientKey);
    var response = await _webApiService.createAccount(userPersonalDetails);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return ""; //Person.fromJson(jsonDecode(successResponse));
    } else {
      //var errorResponse = response as ApiErrorResponse;
      throw Exception(response.body);
    }
  }

  Future<Person> confirmOtp(String email, int code) async {
    var response = await _webApiService.confirmOtp(email, code);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return Person.fromJson(jsonDecode(successResponse));
    } else {
      //var errorResponse = response as ApiErrorResponse;
      throw Exception(response.body);
    }
  }

  Future<Person> loadWallet(double price) async{
    String email = userPersonalDetailsDTO!.userId!;
     var response = await _webApiService.loadWallet(email, price);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return Person.fromJson(jsonDecode(successResponse));
    } else {
      //var errorResponse = response as ApiErrorResponse;
      throw Exception(response.body);
    }
  }
}
