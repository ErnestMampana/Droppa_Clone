import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/courier_pickdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CourierEditIteneraryScreen extends StatefulWidget {
  final String deliveryEstimate;
  final double price;
  const CourierEditIteneraryScreen({
    super.key,
    required this.deliveryEstimate,
    required this.price,
  });

  @override
  State<CourierEditIteneraryScreen> createState() =>
      _CourierEditIteneraryScreenState();
}

class _CourierEditIteneraryScreenState
    extends State<CourierEditIteneraryScreen> {
  bool _isPickSwitched = false;

  final _pickUpnameController = TextEditingController();
  final _pickUpNumberController = TextEditingController();
  final _dropOffNameController = TextEditingController();
  final _dropOffNumberController = TextEditingController();
  final _pickUpCompanyNameController = TextEditingController();
  final _pickUpSuburbController = TextEditingController();
  final _dropOffCompanyNameController = TextEditingController();
  final _dropOffSuburbController = TextEditingController();
  final _specialNoteController = TextEditingController();

  bool _pickNameValid = false;
  bool _pickNumberValid = false;
  String? _bookingDate;
  bool _dropOffSwitch = false;
  bool _dropOffNameValid = false;
  bool _dropOffNumberValid = false;

  String? _vehicleType;
  double? _price;
  String? _dropOffAddress;
  String? _pickUpAddress;

  @override
  void dispose() {
    _pickUpCompanyNameController.dispose();
    _pickUpNumberController.dispose();
    _pickUpSuburbController.dispose();
    _dropOffCompanyNameController.dispose();
    _dropOffNameController.dispose();
    _dropOffNumberController.dispose();
    _specialNoteController.dispose();
    _dropOffSuburbController.dispose();
    _pickUpnameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _price = widget.price;
    _pickUpAddress = LookUp.courierPickUpAddress;
    _dropOffAddress = LookUp.courierDropOffAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Edit Itinerary'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        height: 120,
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
                  Image.asset(
                    'assets/dropskyflight.png',
                    //fit: BoxFit.fitHeight,
                    height: 50,
                    width: 50,
                  ),
                  const Text(
                    'Total (Incl VAT)',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'R $_price',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              RsButton(
                title: 'Proceed to payment',
                radisNumber: 5,
                onTaped: () {
                  // _handleCreateBooking();
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  //width: MediaQuery.of(context).size.width,
                  //height: 210,
                  height: MediaQuery.of(context).size.height * 0.30,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.my_location_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                            SizedBox(
                              height: 60,
                              width: 300,
                              child: Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Pick-up Details',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Text(_pickUpAddress!),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.my_location_outlined,
                            color: Color.fromARGB(255, 226, 13, 13),
                            size: 30,
                          ),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Drop-off Details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    _dropOffAddress!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        endIndent: 30,
                        indent: 30,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Vehicle Type : '),
                          Image.asset(
                            'assets/dropskyflight.png',
                            fit: BoxFit.fitHeight,
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 40, 63, 73),
                    ),
                    //color: Colors.black54,
                    child: const Center(
                      child: Text(
                        'Address Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.050,
              color: Colors.white,
              child: Center(
                child: Text(
                  widget.deliveryEstimate,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.090,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'COURIER BUDGET, COURIER EXPRESS, FLASH FLIGHT, DASH price is inclusive for Goods in Transit insurancelimited to R1000 per shipment.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.050,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.calendar_month),
                    GestureDetector(
                      child: Text(
                          _bookingDate == null ? 'Select date' : '2023-03-28'),
                      onTap: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true, onConfirm: (date) {
                          setState(() {
                            _bookingDate =
                                DateFormat('yyyy-MM-dd').format(date);
                            //_bookingTime = '${date.hour}:${date.minute}';
                          });
                        },
                            currentTime: DateTime.now(),
                            //currentTime: DateTime(2008, 12, 31, 23, 12, 34),
                            locale: LocaleType.en);
                      },
                    ),
                  ],
                ),
              ),
            ),
            CourierPickDropWidget(
              isSwitched: _isPickSwitched,
              title: 'Pick-up Details',
              pickUpOrDrop: 'Pick-Up',
              nameController: _pickUpnameController,
              numberController: _pickUpNumberController,
              nameValid: _pickNameValid,
              numberValid: _pickNumberValid,
              companyNameController: _pickUpCompanyNameController,
              suburbController: _pickUpSuburbController,
              onChanged: (isSwitched) {
                setState(() {
                  _isPickSwitched = isSwitched!;
                  _pickNameValid = false;
                  _pickNumberValid = false;
                  if (_isPickSwitched) {
                    _pickUpNumberController.text =
                        userPersonalDetailsDTO!.cellphone!;
                    _pickUpnameController.text =
                        "${userPersonalDetailsDTO!.userName} ${userPersonalDetailsDTO!.surname}";
                  } else {
                    _pickUpNumberController.text = '';
                    _pickUpnameController.text = '';
                  }
                });
              },
            ),
            CourierPickDropWidget(
              title: 'Drop-off Details',
              pickUpOrDrop: 'Pick-Up',
              nameController: _dropOffNameController,
              numberController: _dropOffNumberController,
              companyNameController: _dropOffCompanyNameController,
              suburbController: _dropOffSuburbController,
              isSwitched: _dropOffSwitch,
              nameValid: _dropOffNameValid,
              numberValid: _dropOffNumberValid,
              onChanged: (isSwitched) {
                setState(
                  () {
                    _dropOffSwitch = isSwitched!;
                    _dropOffNameValid = false;
                    _dropOffNumberValid = false;
                    if (_dropOffSwitch) {
                      _dropOffNumberController.text =
                          userPersonalDetailsDTO!.cellphone!;
                      _dropOffNameController.text =
                          "${userPersonalDetailsDTO!.userName} ${userPersonalDetailsDTO!.surname}";
                    } else {
                      _dropOffNumberController.text = '';
                      _dropOffNameController.text = '';
                    }
                  },
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Number of parcels',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.050,
              color: Colors.white,
              child:  Center(
                child: Text(
                  '${LookUp.parcels.length}',
                  //style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.24,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'What needs to be delivered/special instructions.',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      //controller: _specialNote,
                      decoration: InputDecoration(
                        //labelText: 'Enter Message',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'TERMS AND CONDITIONS',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        Platform.isIOS
                            ? CupertinoSwitch(
                                value: false,
                                onChanged: (value) {},
                                thumbColor: Colors.white,
                                activeColor: Colors.blue,
                              )
                            : Switch(
                                value: false,
                                onChanged: (value) {},
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleCourierBooking() async {
    Map<String, dynamic> bookingData = {
      "pickUpAddress": _pickUpAddress,
      "dropOffAddress": _dropOffAddress,
      "price": _price,
      "vehicleType": _vehicleType,
      "bookingDate": _bookingDate,
      "pickUpNames": _pickUpnameController.text,
      "pickUpContact": _pickUpNumberController.text,
      "pickUpCompanyName": _pickUpCompanyNameController.text,
      "pickUpSuburb": _pickUpSuburbController.text,
      "dropOffNames": _dropOffNumberController.text,
      "dropOffContact": _dropOffNumberController.text,
      "dropOffCompanyName": _dropOffCompanyNameController.text,
      "dropOffSuburb": _dropOffSuburbController.text,
      "specialNote": _specialNoteController.text,
    };
  }
}
