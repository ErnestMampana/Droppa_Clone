// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/payment_method.dart';

class WalletCreditScreen extends StatefulWidget {
  final double totalPrice;
  const WalletCreditScreen({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  State<WalletCreditScreen> createState() => _WalletCreditScreenState();
}

class _WalletCreditScreenState extends State<WalletCreditScreen> {
  int _groupValue = 0;
  String? _paymentType;
  double? _price;
  final UserService _userService = UserService();
  
   final _promoCodeController = TextEditingController();
   
     bool _enabled = true;

  @override
  void initState() {
    // TODO: implement initState
    _price = widget.totalPrice;
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
                    'TOTAL ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'R ${widget.totalPrice}',
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
              height: 400,
              width: 400,
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
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                              onPressed: _enabled ?  () {
                                _handlePromo();
                              } : (){} ,
                              color: Colors.black,
                              child:  Text(
                                _enabled ?'Apply':
                                'Applied',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              width: 400,
              child: MaterialButton(
                onPressed: () async {
                  var sc = await _handlePayment();
                  if (sc) {
                    Navigator.pop(context);
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

  Future<bool> _handlePayment() async {
    bool success = false;   
      try {
        double amount = await _userService.loadWallet(_price!);
        context.read<AppData>().changePrice(amount);
        success = true;
      } catch (e) {
        DialogUtils.showErrorMessage(context, e.toString());
      }
    
    return success;
  }

  void _handlePromo() async {
    try {
      // Map<String, dynamic> promoData = {
      //   "bookingPrice": _totalPrice,
      //   "promoCode": _promoCodeController.text
      // };
      // double response = await _userService.applyPromoCode(promoData);
      setState(() {
        // _totalPrice = response;
        _enabled = false;
      });
    } catch (e) {
      DialogUtils.showErrorMessage(context, e.toString());
    }
  }
}
