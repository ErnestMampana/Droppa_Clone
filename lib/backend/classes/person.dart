import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:flutter/material.dart';

Person? userPersonalDetailsDTO;

class Person with ChangeNotifier {
  String? userId;
  String? userName;
  String? surname;
  String? celphoneNumber;
  double? walletBalance;
  List<Booking>? myBookings;
  String? token;

  Person({
    this.userId,
    this.userName,
    this.celphoneNumber,
    this.walletBalance,
    this.myBookings,
    this.surname,
    this.token,
});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        userId : json['userid'], 
        userName:json['userName'], 
        celphoneNumber:json['celphoneNumber'], 
        walletBalance : json['walletBalance'], 
        myBookings : json['myBookings'], 
        surname:json['surname'],
        token: json['token']
        );
  }

// double get balance => walletBalance!;
  notifyListeners();
}
