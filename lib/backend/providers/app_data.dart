import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  double _walletPrice = 885.0;
  void changePrice(double price) {
    _walletPrice = price;
    notifyListeners();
  }

  double get walletPrice => _walletPrice;
}
