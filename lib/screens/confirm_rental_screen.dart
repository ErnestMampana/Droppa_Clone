import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io' show Platform;

class ConfirmRentalScreen extends StatefulWidget {
  const ConfirmRentalScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Rental'),
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
                  const Text(
                    'R 1 214,00',
                    style: TextStyle(
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
                  const Text(
                    'R 1 214,00',
                    style: TextStyle(
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
                  const Text(
                    'R 1 214,00',
                    style: TextStyle(
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
                onTaped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ConfirmRentalScreen(),
                    ),
                  );
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
              Text(
                'Additional Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              RentalTextField(
                label: 'Company Name(Optional)',
                textController: _companyNameTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                label: 'Contact Person Name',
                textController: _conatactPersonTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                label: 'Mobile Number',
                textController: _mobileNumberTextController,
              ),
              const SizedBox(
                height: 15,
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
                  });
                },
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                label: 'Number of Labour(s) (R700/labour)',
                textController: _laboursTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
                label: 'Number Of days',
                textController: _numberOfDaysTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              RentalTextField(
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
}
