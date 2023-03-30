import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:flutter/material.dart';

Person? userPersonalDetailsDTO;

class Person with ChangeNotifier {
  String? email;
  String? userName;
  String? surname;
  String? cellphone;
  double? walletBalance;
  List<Booking>? myBookings;
  String? token;

  Person({
    this.email,
    this.userName,
    this.cellphone,
    this.walletBalance,
    this.myBookings,
    this.surname,
    this.token,
});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        email : json['email'],
        userName:json['userName'],
        cellphone:json['cellphone'],
        walletBalance : json['walletBalance'], 
        myBookings : json['myBookings'], 
        surname:json['surname'],
        token: json['token']
        );
  }

}
