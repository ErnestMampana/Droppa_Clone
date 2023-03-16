import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  double _walletPrice = 00.0;
  void changePrice(double price) {
    _walletPrice = price;
    notifyListeners();
  }

  double get walletPrice => _walletPrice;

  void refreshBookings(Booking booking){
    LookUp.bookings.add(booking);
    notifyListeners();
  }
}
