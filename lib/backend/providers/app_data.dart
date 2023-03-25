import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  double _walletPrice = 00.0;
  int _bookingCount = 0;
  void changePrice(double price) {
    _walletPrice = price;
    userPersonalDetailsDTO!.walletBalance = _walletPrice;
    notifyListeners();
  }

  double get walletPrice => _walletPrice;
  int get bookingCount => _bookingCount;

  void addBooking(Booking booking) {
    LookUp.bookings.add(booking);
    _bookingCount = LookUp.bookings.length;
    notifyListeners();
  }

  void refreshBookingCount(){
     _bookingCount = LookUp.bookings.length;
     notifyListeners();
  }

  void clearBooking() {
    LookUp.bookings.clear();
    _bookingCount = LookUp.bookings.length;
    notifyListeners();
  }

  void refreshBookings(){

  }

  void refreshUser(Person user) {
    userPersonalDetailsDTO = user;
    notifyListeners();
  }
}
