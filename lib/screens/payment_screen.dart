// ignore_for_file: use_build_context_synchronously

import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/payment_method.dart';

class PaymentScreen extends StatefulWidget {
  final double price;
  final String bookingId;
  final String bookingScreen;
  const PaymentScreen(
      {super.key,
      required this.price,
      required this.bookingId,
      required this.bookingScreen});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double? _totalPrice;
  int _groupValue = 0;

  final _promoCodeController = TextEditingController();

  final _userService = UserService();

  String? _paymentType;

  bool _enabled = true;

  @override
  void initState() {
    _totalPrice = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'TOTAL (Inc Vat)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'R $_totalPrice',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'SELECT PAYMENT METHOD',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Consumer<AppData>(
                                builder: (context, value, child) {
                                  return Text(
                                    'Wallet balance: R ${value.walletPrice}', //${userPersonalDetailsDTO!.walletBalance!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Radio(
                              value: 1,
                              groupValue: _groupValue,
                              onChanged: (value) {
                                setState(() {
                                  _groupValue = 1;
                                  _paymentType = 'Wallet';
                                });
                              },
                            ),
                          ],
                        )),
                  ),
                  PaymentMethodSelect(
                    imageUrl: 'assets/payfast.png',
                    price: "PayFast",
                    value: 2,
                    groupValue: _groupValue,
                    onChanged: (value) {
                      setState(() {
                        _groupValue = 2;
                        _paymentType = 'PayFast';
                      });
                    },
                  ),
                  PaymentMethodSelect(
                    imageUrl: 'assets/ozow.png',
                    price: "OZOW",
                    value: 3,
                    groupValue: _groupValue,
                    onChanged: (value) {
                      setState(() {
                        _groupValue = 3;
                        _paymentType = 'OZOW';
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Promo Code',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 225,
                              height: 30,
                              child: TextField(
                                enabled: _enabled,
                                controller: _promoCodeController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: _enabled
                                  ? () {
                                      _handlePromo();
                                    }
                                  : () {},
                              color: Colors.black,
                              child: Text(
                                _enabled ? 'Apply' : 'Applied',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: MaterialButton(
                onPressed: () async {
                  var sc = widget.bookingScreen == 'Fleet_Booking'
                      ? await _handleFleetBookingPayment()
                      : await _handleRentalBookingPayment();
                  if (sc) {
                    context.read<AppData>().changePrice(
                        userPersonalDetailsDTO!.walletBalance! - _totalPrice!);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MainActivityScreen(),
                      ),
                    );
                  }
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 0,
                minWidth: double.maxFinite,
                child: const Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _handleFleetBookingPayment() async {
    bool success = false;
    Map<String, dynamic> paymentObject = {
      "userId": userPersonalDetailsDTO!.email,
      "bookingId": widget.bookingId,
      "paymentType": _paymentType,
      "usedPromo": _promoCodeController.text,
      "bookingPrice": _totalPrice,
    };
    if (_paymentType == 'Wallet') {
      try {
        await _userService.makeBookingPayment(paymentObject);
        success = true;
      } catch (e) {
        DialogUtils.showErrorMessage(context, e.toString());
      }
    }
    return success;
  }

  Future<bool> _handleRentalBookingPayment() async {
    bool success = false;
    Map<String, dynamic> paymentObject = {
      "userId": userPersonalDetailsDTO!.email,
      "bookingId": widget.bookingId,
      "paymentType": _paymentType,
      "usedPromo": _promoCodeController.text,
      "bookingPrice": _totalPrice,
    };
    if (_paymentType == 'Wallet') {
      try {
        await _userService.makeRentalBookingPayment(paymentObject);
        success = true;
      } catch (e) {
        DialogUtils.showErrorMessage(context, e.toString());
      }
    }
    return success;
  }

  void _handlePromo() async {
    try {
      Map<String, dynamic> promoData = {
        "bookingPrice": _totalPrice,
        "promoCode": _promoCodeController.text
      };
      double response = await _userService.applyPromoCode(promoData);
      setState(() {
        _totalPrice = response;
        _enabled = false;
      });
    } catch (e) {
      DialogUtils.showErrorMessage(context, e.toString());
    }
  }
}
