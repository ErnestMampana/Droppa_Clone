import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/screens/rental_quote_screen.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';

class RentalServiceScreen extends StatefulWidget {
  const RentalServiceScreen({Key? key}) : super(key: key);

  @override
  State<RentalServiceScreen> createState() => _RentalServiceScreenState();
}

class _RentalServiceScreenState extends State<RentalServiceScreen> {
//Text Controllers
  final _postalCodeTextController = TextEditingController();
  final _suburbTextController = TextEditingController();
  final _complexNameTextController = TextEditingController();
  final _unitNumberTextController = TextEditingController();
  final _provinceController = TextEditingController();
  final _truckTypeController = TextEditingController();
  final _streetTextController = TextEditingController();

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  String? _startDate;
  String? _endDate;

  bool _isSwitched = false;
  bool _streetAddressValid = false;
  bool _postalCodeValid = false;
  bool _suburbValid = false;
  final bool _complexNameValid = false;
  final bool _unitValid = false;
  double _bookingPrice = 14000;

  @override
  void dispose() {
    _postalCodeTextController.dispose();
    _suburbTextController.dispose();
    _complexNameTextController.dispose();
    _unitNumberTextController.dispose();
    _provinceController.dispose();
    _truckTypeController.dispose();
    _streetTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Rental Service'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(children: const [
                Text(
                  'Collection Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _streetAddressValid = false;
                  });
                },
                label: 'Street Address',
                textController: _streetTextController,
                textValid: _streetAddressValid,
              ),
              const SizedBox(
                height: 20,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _postalCodeValid = false;
                  });
                },
                textValid: _postalCodeValid,
                label: 'Postal Code',
                textController: _postalCodeTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              RentalTextField(
                onTap: () {
                  setState(() {
                    _suburbValid = false;
                  });
                },
                textValid: _suburbValid,
                label: 'Suburb',
                textController: _suburbTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: const [
                Text(
                  'Province',
                  textAlign: TextAlign.start,
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 7,
                  ),
                  border: OutlineInputBorder(),
                ),
                items: LookUp.provinces
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    FocusScope.of(context).requestFocus(FocusNode());

                    //_province = value;
                    _provinceController.text = value!;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RentalTextField(
                onTap: () {},
                textValid: _complexNameValid,
                label: 'Complex Name (Optional)',
                textController: _complexNameTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              RentalTextField(
                onTap: () {},
                textValid: _unitValid,
                label: 'Unit Number/Floor (Optional)',
                textController: _unitNumberTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: const [
                Text(
                  'Rental Period',
                  textAlign: TextAlign.start,
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(
                    const Duration(days: 4),
                  ),
                  DateTime.now().add(
                    const Duration(days: 3),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: const [
                Text(
                  'Type Of Truck',
                  textAlign: TextAlign.start,
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 7,
                  ),
                  border: OutlineInputBorder(),
                ),
                items: LookUp.typesOfTruck.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (dynamic value) {
                  setState(
                    () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _truckTypeController.text = value!;
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('is the distance over 200km?'),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RsButton(
                title: 'Next',
                radisNumber: 5,
                onTaped: () {
                  bool sc = _setValues();
                  if (sc) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RentalQuoteScreen(price: _bookingPrice),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
        _startDate = DateFormat('yyyy-MM-dd').format(args.value.startDate);
        _endDate = DateFormat('yyyy-MM-dd')
            .format(args.value.endDate ?? args.value.startDate);
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  bool _setValues() {
    bool success = false;
    if (_streetTextController.text.isEmpty &&
        _postalCodeTextController.text.isEmpty &&
        _suburbTextController.text.isEmpty) {
      setState(() {
        _streetAddressValid = true;
        _postalCodeValid = true;
        _suburbValid = true;
      });
    } else if (_streetTextController.text.isEmpty) {
      _streetAddressValid = true;
    } else if (_postalCodeTextController.text.isEmpty) {
      _postalCodeValid = true;
    } else if (_suburbTextController.text.isEmpty) {
      _suburbValid = true;
    } else {
      LookUp.streetAddress = _streetTextController.text;
      LookUp.postalCode = int.parse(_postalCodeTextController.text);
      LookUp.suburb = _suburbTextController.text;
      LookUp.province = _provinceController.text;
      LookUp.complexName = _complexNameTextController.text;
      LookUp.unitNumber = _unitNumberTextController.text == ""
          ? 0
          : int.parse(_unitNumberTextController.text);
      LookUp.startDate = _startDate;
      LookUp.endDate = _endDate;
      LookUp.truckType = _truckTypeController.text;
      success = true;
    }
    return success;
  }
}
