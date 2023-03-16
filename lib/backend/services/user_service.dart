import 'dart:convert';
import 'dart:ffi';

import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart';

import '../../LookUp/lookup.dart';

class UserService {
  final WebApiDataService _webApiService = WebApiDataService();

  Future<String> createAccount(Map<String, dynamic> userPersonalDetails) async {
    //var key = await _storage.read(key: clientKey);
    var response = await _webApiService.createAccount(userPersonalDetails);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return "";
    } else {
      throw Exception(response.body);
    }
  }

  Future<Person> confirmOtp(String email, int code) async {
    var response = await _webApiService.confirmOtp(email, code);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      userPersonalDetailsDTO = Person.fromJson(jsonDecode(successResponse));
      return Person.fromJson(jsonDecode(successResponse));
    } else {
      throw Exception(response.body);
    }
  }

  Future<double> loadWallet(double price) async {
    String email = userPersonalDetailsDTO!.userId!;
    var response = await _webApiService.loadWallet(email, price);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return jsonDecode(successResponse);
    } else {
      throw Exception(response.body);
    }
  }

  Future<Person> login(Map<String, dynamic> userdetails) async {
    var response = await _webApiService.login(userdetails);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      userPersonalDetailsDTO = Person.fromJson(jsonDecode(successResponse));
      return Person.fromJson(jsonDecode(successResponse));
    } else {
      throw Exception(response.body);
    }
  }

  Future<double> requestPrice(Map<String, dynamic> addressDetails) async {
    var response = await _webApiService.requestPrice(addressDetails);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      return jsonDecode(successResponse);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> createBooking(Map<String, dynamic> booking) async {
    var response = await _webApiService.createBooking(booking);
    if (response.statusCode == 200) {
      var successResponse = response.body;
      var booking = Booking.fromJson(jsonDecode(successResponse));
      LookUp.bookings.add(booking);
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<Booking>> getAllBookings(String? userId) async {
    var response = await _webApiService.getAllBookings(userId!);
    if (response.statusCode == 200) {
      var successResponse = response.body;

      List<dynamic> responseData = jsonDecode(successResponse);
      for (var element in responseData) { 
        LookUp.bookings.add(Booking.fromJson(element));
      }
      List<Booking> bookings =[];
      return bookings;
    } else {
      throw Exception(response.body);
    }
  }
}
