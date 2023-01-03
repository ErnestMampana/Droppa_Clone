import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:flutter/material.dart';

Person? userPersonalDetailsDTO;

class Person {
  String? userId;
  String userName;
  String surname;
  String celphoneNumber;
  String walletBalance;
  List<Booking> myBookings;

  Person(
    this.userId,
    this.userName,
    this.celphoneNumber,
    this.walletBalance,
    this.myBookings,
    this.surname,
  );
}
