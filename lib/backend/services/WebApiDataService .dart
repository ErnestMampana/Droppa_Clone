import 'dart:convert';

import 'package:droppa_clone/backend/services/http_service.dart';
import 'package:http/http.dart';

import '../models/api_base_mode.dart';

class WebApiDataService {
  final String baseUrl = "http://10.0.2.2:8080/api/v1";

  //final String apiBaseSagment = "api/v1";
  final HttpService httpService = HttpService();

  Future<Response> createAccount(
      Map<String, dynamic> userPersonalDetails) async {
    var url = "$baseUrl/auth/register";
    var requestBody = jsonEncode(userPersonalDetails);
    return await httpService.post(url, requestBody);
    //return a;
  }

  Future<Response> confirmOtp(String email, int code) async {
    var url = "$baseUrl/user/email/confirmation/$email?code=$code";
    //var requestBody = jsonEncode(userPersonalDetails);
    return await httpService.put(url, null);
  }

  Future<Response> login(Map<String, dynamic> userdetails) async {
    var url = "$baseUrl/auth/login";
    var requestBody = jsonEncode(userdetails);
    return await httpService.post(url, requestBody);
  }

  Future<Response> getBookingsForUser(String userId) async {
    var url = "$baseUrl/booking/bookingByUserId/$userId";
    return await httpService.get(url);
  }

  Future<Response> loadWallet(String email, double price) async {
    var url = "$baseUrl/user/loadwallet/$email?amount=$price";
    //var requestBody = jsonEncode(userPersonalDetails);
    return await httpService.put(url, null);
  }

  requestPrice(Map<String, dynamic> addressDetails) async {
    var url = "$baseUrl/booking/getprice";
    var requestBody = jsonEncode(addressDetails);
    return await httpService.post(url, requestBody);
  }

  createBooking(Map<String, dynamic> booking) async {
    var url = "$baseUrl/booking/book";
    var requestBody = jsonEncode(booking);
    return await httpService.post(url, requestBody);
  }

  Future<Response> getAllBookings(String userId) async {
    var url = "$baseUrl/booking/bookingByUserId/$userId";
    return await httpService.get(url);
  }

  Future<Response> logOut() async {
    var url = "$baseUrl/auth/logout";
    return await httpService.get(url);
  }

  Future<Response> cancelBooking(String? userId, String? bookingId) async {
    var url = "$baseUrl/booking/cancelBooking/$bookingId?userId=$userId";
    //var requestBody = jsonEncode(userPersonalDetails);
    return await httpService.put(url, null);
  }

  makeBookingPayment(Map<String, dynamic> paymentObject) async {
    var url = "$baseUrl/booking/makePayment";
    var requestBody = jsonEncode(paymentObject);
    return await httpService.put(url, requestBody);
  }

  Future<Response> applyPromoCode(Map<String, dynamic> promoData) async {
    var url = "$baseUrl/booking/applypromocode";
    var requestBody = jsonEncode(promoData);
    return await httpService.post(url, requestBody);
  }

  // Future<BaseApiResponse> updatePersonalDetails(
  //     Map<String, dynamic> userPersonalDetails, String? userId) async {
  //   var url = "$baseUrl/$apiBaseSagment/Candidate/$userId/Update";
  //   var requestBody = jsonEncode(userPersonalDetails);
  //   return await httpService.postAuthenticated(url, requestBody);
  // }

  // Future<BaseApiResponse> updateSpecialization(
  //     Map<String, dynamic>? userSpecializationDetails, String? userId) async {
  //   var url =
  //       "$baseUrl/$apiBaseSagment/Candidate/$userId/TeachingSubjects/SaveOrUpdate";
  //   var requestBody = jsonEncode(userSpecializationDetails);
  //   return await httpService.postAuthenticated(url, requestBody);
  // }

  // Future<BaseApiResponse> updateQualification(
  //     Map<String, dynamic> userQualificationDetails, String? userId) async {
  //   var url =
  //       "$baseUrl/$apiBaseSagment/Candidate/$userId/Qualification/SaveOrUpdate";
  //   var requestBody = jsonEncode(userQualificationDetails);
  //   return await httpService.postAuthenticated(url, requestBody);
  // }

  // Future<BaseApiResponse> resetPassword(
  //     String idNumber, String password) async {
  //   var url = "$baseUrl/$apiBaseSagment/Auth/Password/Reset";
  //   var requestBody = jsonEncode(
  //       <String, String>{"idNumber": idNumber, "password": password});
  //   return await httpService.post(url, requestBody);
  // }

  // Future<BaseApiResponse> confirmPin(String? pinKey, String pin) async {
  //   var url = "$baseUrl/$apiBaseSagment/Pin/$pinKey/Verify";
  //   var requestBody = jsonEncode(<String, String>{
  //     "PinCode": pin,
  //   });
  //   return await httpService.post(url, requestBody);
  // }

  // Future<BaseApiResponse> resendPin(String? pinKey) async {
  //   var url = "$baseUrl/$apiBaseSagment/Pin/$pinKey/Resend";
  //   return await httpService.get(url);
  // }

  // // end of password reset

  // //Lookups

  // Future<BaseApiResponse> getVacancies(String? userId, String status) async {
  //   var url = "$baseUrl/$apiBaseSagment/User/$userId/vacancy/status/$status";
  //   return await httpService.getAuthenticated(url);
  // }

  // Future<BaseApiResponse> getCandidateTeachingSubjects(String? userId) async {
  //   var url =
  //       "$baseUrl/$apiBaseSagment/User/$userId/Candidate/TeachingSubjects";
  //   return await httpService.getAuthenticated(url);
  // }

  // Future<BaseApiResponse> getMunicipalities() async {
  //   var url = "$baseUrl/$apiBaseSagment/Lookup/Municipality";
  //   return await httpService.get(url);
  // }

  // Future<BaseApiResponse> getWards(String municipalityId) async {
  //   var url =
  //       "$baseUrl/$apiBaseSagment/Lookup/Municipality/$municipalityId/Ward";
  //   return await httpService.get(url);
  // }

  // Future<BaseApiResponse> getBursaries() async {
  //   var url = "$baseUrl/$apiBaseSagment/Lookup/Bursary";
  //   return await httpService.get(url);
  // }

  // Future<BaseApiResponse> getSchools() async {
  //   var url = "$baseUrl/$apiBaseSagment/Lookup/School";
  //   return await httpService.get(url);
  // }

  // Future<BaseApiResponse> getSubjects() async {
  //   var url = "$baseUrl/$apiBaseSagment/Lookup/Subject";
  //   return await httpService.get(url);
  // }

  // Future<BaseApiResponse> getDistrict() async {
  //   var url = "$baseUrl/$apiBaseSagment/Lookup/District";
  //   return await httpService.get(url);
  // }

  // // end of lookups

  // // user profile

  // Future<BaseApiResponse> getProfile(String? userId) async {
  //   var url = "$baseUrl/$apiBaseSagment/user/$userId/candidate/profile";
  //   return await httpService.getAuthenticated(url);
  // }

  // Future<BaseApiResponse> getQualifications(String? userId) async {
  //   var url = "$baseUrl/$apiBaseSagment/user/$userId/candidate/qualifications";
  //   return await httpService.getAuthenticated(url);
  // }

  // // end of user profile

  // //Vacancy application
  // Future<BaseApiResponse> applyForVacancy(Map<String, dynamic> userApplication,
  //     String? userId, String? vacancyId) async {
  //   var url = "$baseUrl/$apiBaseSagment/User/$userId/Vacancy/$vacancyId";
  //   var requestBody = jsonEncode(userApplication);
  //   return await httpService.postAuthenticated(url, requestBody);
  // }
}
