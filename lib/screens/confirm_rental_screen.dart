// ignore_for_file: use_build_context_synchronously

import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/Rental.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/screens/payment_screen.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ConfirmRentalScreen extends StatefulWidget {
  final double price;
  const ConfirmRentalScreen({super.key, required this.price});

  @override
  State<ConfirmRentalScreen> createState() => _ConfirmRentalScreenState();
}

class _ConfirmRentalScreenState extends State<ConfirmRentalScreen> {
  bool _isSwitched = false;

  //Text Controllers
  final TextEditingController _laboursTextController = TextEditingController();
  final TextEditingController _companyNameTextController =
      TextEditingController();
  final TextEditingController _conatactPersonTextController =
      TextEditingController();
  final TextEditingController _mobileNumberTextController =
      TextEditingController();
  final TextEditingController _numberOfDaysTextController =
      TextEditingController();
  final TextEditingController _instructionTextController =
      TextEditingController();
  final _brunchController = TextEditingController();

  double _totalPrice = 0.0;

  final UserService _userService = UserService();

  bool _companyNameValid = false;
  bool _contactPersonValid = false;
  bool _mobileNumberValid = false;
  bool _laboursValid = false;
  bool _deliveryNoteValid = false;

  @override
  void dispose() {
    _laboursTextController.dispose();
    _companyNameTextController.dispose();
    _conatactPersonTextController.dispose();
    _mobileNumberTextController.dispose();
    _numberOfDaysTextController.dispose();
    _instructionTextController.dispose();
    _brunchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _totalPrice = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Rental'),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        height: 160,
        color: const Color.fromARGB(255, 15, 44, 68),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sub Total',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'R $_totalPrice',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'VAT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'R ${_totalPrice * 0.15}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total (Incl VAT)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'R ${_totalPrice + _totalPrice * 0.15}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              RsButton(
                title: 'Confirm Rental',
                radisNumber: 5,
                onTaped: () async {
                  if (userPersonalDetailsDTO == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  } else {
                    var sc = await _handleRentalBooking();
                    if (sc) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentScreen(
                            bookingId: rentalDetails!.rentalId!,
                            price: _totalPrice,
                            bookingScreen: 'Rental_Booking',
                          ),
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Additional Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _companyNameValid = false;
                  });
                },
                textValid: _companyNameValid,
                label: 'Company Name(Optional)',
                textController: _companyNameTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _contactPersonValid = false;
                  });
                },
                textValid: _contactPersonValid,
                label: 'Contact Person Name',
                textController: _conatactPersonTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _mobileNumberValid = false;
                  });
                },
                textValid: _mobileNumberValid,
                label: 'Mobile Number',
                textController: _mobileNumberTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(children: const [
                Text(
                  'Brunch',
                  textAlign: TextAlign.start,
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 7),
                  border: OutlineInputBorder(),
                ),
                items: LookUp.rentalBranch
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _brunchController.text = value!;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _laboursValid = false;
                  });
                },
                textValid: _laboursValid,
                label: 'Number of Labour(s) (R700/labour)',
                textController: _laboursTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _deliveryNoteValid = false;
                  });
                },
                textValid: _deliveryNoteValid,
                label: 'Enter Delivery/Special Instruction',
                textController: _instructionTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'TEARMS AND CONDITIONS',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Platform.isIOS
                          ? CupertinoSwitch(
                              value: _isSwitched,
                              onChanged: (value) {
                                _isSwitched = value;
                                setState(
                                  () {},
                                );
                              },
                              thumbColor: Colors.white,
                              activeColor: Colors.blue,
                            )
                          : Switch(
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _isSwitched = value;
                                  },
                                );
                              },
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _handleRentalBooking() async {
    bool success = false;
    if (_conatactPersonTextController.text.isEmpty &&
        _mobileNumberTextController.text.isEmpty &&
        _laboursTextController.text.isEmpty) {
      setState(() {
        _contactPersonValid = true;
        _mobileNumberValid = true;
        _laboursValid = true;
      });
    } else if (_conatactPersonTextController.text.isEmpty) {
      _contactPersonValid = true;
    } else if (_mobileNumberTextController.text.isEmpty) {
      _mobileNumberValid = true;
    } else if (_laboursTextController.text.isEmpty) {
      _laboursValid = true;
    } else {
      Map<String, dynamic> rentalData = {
        "userId": userPersonalDetailsDTO!.email,
        "streetAddress": LookUp.streetAddress,
        "postalCode": LookUp.postalCode,
        "suburb": LookUp.suburb,
        "province": LookUp.province,
        "complexName": LookUp.complexName,
        "unitNumber": LookUp.unitNumber,
        "startDate": LookUp.startDate,
        "endDate": LookUp.endDate,
        "truckType": LookUp.truckType,
        "price": widget.price,
        "companyName": _companyNameTextController.text,
        "contactPerson": _conatactPersonTextController.text,
        "mobileNumber": _mobileNumberTextController.text,
        "rentalBrunch": _brunchController.text,
        "labours": _laboursTextController.text,
        "noDays": LookUp.noDays,
        "instruction": _instructionTextController.text,
      };

      var response = await _userService.createRentalBooking(rentalData);

      if (response.rentalId != null) {
        rentalDetails = response;
        success = true;
      }
    }

    return success;
  }
}
