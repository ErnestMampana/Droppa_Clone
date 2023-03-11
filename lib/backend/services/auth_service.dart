import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/api_base_mode.dart';
import '../models/otp_model.dart';
import 'WebApiDataService .dart';

class AuthService {
  final WebApiDataService _webApiService = WebApiDataService();
  final String authKey = "authKey";
final String clientKey = "clientKey";
  final _storage = FlutterSecureStorage();

  Future<String> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "";
    } catch (e) {
      return e.toString();
    }
  }

  // Future<String> requestCreateAccountAsync(
  //     Map<String, dynamic> userPersonalDetails) async {
  //   var response = await _webApiService.createAccount(userPersonalDetails);
  //   if (response.success!) {
  //     var successResponse = response as ApiResponse;
  //     debugPrint("ADB: profile creating success");
  //     return "";
  //   } else {
  //     var errorResponse = response as ApiErrorResponse;
  //     throw new Exception(errorResponse.error!.message);
  //   }
  // }

  // Future<OtpModel> requestResetPasswordAsync(
  //     String idNumber, String password) async {
  //   var response = await _webApiService.resetPassword(idNumber, password);
  //   if (response.success!) {
  //     var successResponse = response as ApiResponse;
  //     return OtpModel.fromJson(successResponse.data);
  //   } else {
  //     var errorResponse = response as ApiErrorResponse;
  //     throw new Exception(errorResponse.error!.message);
  //   }
  // }

  // Future<OtpModel> verifyPinAsync(String pinKey, String pin) async {
  //   var response = await _webApiService.confirmPin(pinKey, pin);
  //   if (response.success!) {
  //     var successResponse = response as ApiResponse;
  //     return OtpModel.fromJson(successResponse.data);
  //   } else {
  //     var errorResponse = response as ApiErrorResponse;
  //     throw new Exception(errorResponse.error!.message);
  //   }
  // }

  // Future<OtpModel> changePasswordAsync(String idNumber, String password) async {
  //   //TODO : implement this
  // }

  Future<String?> loginAsync(String idNumber, String password) async {
    try {
      var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "$idNumber@doe.kzn.gov", password: password);
      await _storage.write(key: clientKey, value: response.user!.uid);

      return "";
    } catch (e) {
      return e.toString();
    }
  }

  Future resetUserPassword(String idNumber) async {
    try {
      // call api
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
