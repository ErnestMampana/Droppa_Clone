import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/counter.dart';
import 'package:droppa_clone/widgets/date_time.dart';
import 'package:droppa_clone/widgets/pickdrop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditItineraryScreen extends StatefulWidget {
  final double quotePrice;
  final String vehicleType;
  final String pickUpAdress;
  final String dropOffAdress;
  const EditItineraryScreen(
      {super.key,
      required this.quotePrice,
      required this.vehicleType,
      required this.pickUpAdress,
      required this.dropOffAdress});

  @override
  State<EditItineraryScreen> createState() => _EditItineraryScreenState();
}

class _EditItineraryScreenState extends State<EditItineraryScreen> {
  //controllers
  final TextEditingController _pickUpname = TextEditingController();
  final TextEditingController _pickUpNumber = TextEditingController();
  final TextEditingController _dropOffName = TextEditingController();
  final TextEditingController _dropOffNumber = TextEditingController();
  final TextEditingController _specialNote = TextEditingController();
  //Variables
  bool _isSwitched = false;
  bool _isPickSwitched = false;
  bool _pickNameValid = false;
  bool _dropOffSwitch = false;
  bool _dropOffNameValid = false;
  bool _dropOffNumberValid = false;
  bool _pickNumberValid = false;
  int _labourNumber = 1;
  int _loadsNumber = 1;

  late double _totalPrice;
  final double _labourPrice = 0.0;
  late double _price;
  late String _vehicleType;
  late String _dropOffAdress;
  late String _pickUpAdress;

  @override
  void initState() {
    super.initState();
    _price = widget.quotePrice;
    _totalPrice = _price;
    _vehicleType = widget.vehicleType;
    _dropOffAdress = widget.dropOffAdress;
    _pickUpAdress = widget.pickUpAdress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Edit Itinerary'),
        centerTitle: true,
        actions: const [
          Icon(Icons.chat),
        ],
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
                    'R $_totalPrice',
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
                  _handlePriceCalculations();
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
                  width: 400,
                  height: 210,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
                              height: 75,
                              width: 300,
                              child: Column(
                                children: [
                                  const Text('Pick-up Details'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Text(_pickUpAdress),
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
                              height: 75,
                              width: 300,
                              child: Column(
                                children: [
                                  const Text('Drop-off Details'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Text(_dropOffAdress),
                                  ),
                                ],
                              ),
                            ),
                          ]),
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
            const DateAndTime(
              icon: Icons.calendar_month_outlined,
              title: 'Date',
            ),
            const SizedBox(
              height: 10,
            ),
            const DateAndTime(
              icon: Icons.watch_later_outlined,
              title: 'Time',
            ),
            PickUpAndDrop(
              isSwitched: _isPickSwitched,
              title: 'Pick-up Details',
              pickUpOrDrop: 'Pick-Up',
              nameController: _pickUpname,
              numberController: _pickUpNumber,
              nameValid: _pickNameValid,
              numberValid: _pickNumberValid,
              onChanged: (isSwitched) {
                setState(() {
                  _isPickSwitched = isSwitched!;
                  if (_isPickSwitched) {
                    _pickUpNumber.text = userPersonalDetailsDTO!.celphoneNumber!;
                    _pickUpname.text =
                        "${userPersonalDetailsDTO!.userName} ${userPersonalDetailsDTO!.surname}";
                  } else {
                    _pickUpname.text = '';
                    _pickUpNumber.text = '';
                  }
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Specify the numebr of people you wish to assist you with your move',
              ),
            ),
            Counter(
              number: _labourNumber,
              onTapPlus: () {
                setState(() {
                  _labourNumber += 1;
                  if (_labourNumber >= 2) {
                    //_labourPrice += 200;
                    _totalPrice += 200;
                    //print('Ernest =============== $_labourPrice');
                  }
                });
              },
              onTapMinus: _labourNumber == 1
                  ? null
                  : () {
                      setState(() {
                        if (_labourNumber >= 2) {
                          _labourNumber -= 1;
                          // _labourPrice -= 200;
                          _totalPrice -= 200;
                          //print('Ernest =============== $_labourPrice');
                        }
                      });
                    },
            ),
            const SizedBox(
              height: 10,
            ),
            PickUpAndDrop(
              title: 'Drop-off Details',
              pickUpOrDrop: 'Drop-Off',
              nameController: _dropOffName,
              numberController: _dropOffNumber,
              isSwitched: _dropOffSwitch,
              nameValid: _dropOffNameValid,
              numberValid: _dropOffNumberValid,
              onChanged: (isSwitched) {
                setState(() {
                  _dropOffSwitch = isSwitched!;
                  if (_dropOffSwitch) {
                    _dropOffNumber.text =
                        userPersonalDetailsDTO!.celphoneNumber!;
                    _dropOffName.text =
                        "${userPersonalDetailsDTO!.userName} ${userPersonalDetailsDTO!.surname}";
                  } else {
                    _dropOffNumber.text = '';
                    _dropOffName.text = '';
                  }
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'How many loads?',
                ),
              ),
            ),
            Counter(
              number: _loadsNumber,
              onTapPlus: () {
                setState(() {
                  _loadsNumber += 1;
                  _totalPrice += _price;
                });
              },
              onTapMinus: _loadsNumber == 1
                  ? null
                  : () {
                      setState(() {
                        _loadsNumber -= 1;
                        _totalPrice -= _price;
                      });
                    },
            ),
            Container(
              width: 400,
              height: 200,
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'What needs to be delivered/special instructions?',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 100,
                      child: TextField(
                        controller: _specialNote,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
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
            )
          ],
        ),
      ),
    );
  }

  _handlePriceCalculations() {
    setState(() {
      if (_pickUpNumber.text.isEmpty &&
          _pickUpname.text.isEmpty &&
          _dropOffName.text.isEmpty &&
          _dropOffNumber.text.isEmpty) {
        _pickNumberValid = true;
        _pickNameValid = true;
        _dropOffNameValid = true;
        _dropOffNumberValid = true;
      } else if (_pickUpNumber.text.isEmpty) {
        _pickNumberValid = true;
      } else if (_pickUpname.text.isEmpty) {
        _pickNameValid = true;
      } else if (_dropOffName.text.isEmpty) {
        _dropOffNameValid = true;
      } else if (_dropOffNumber.text.isEmpty) {
        _dropOffNumberValid = true;
      } else {
        LookUp.bookings.add(
          Booking(
            date: '24/12/2022',
            dropOffName: _dropOffName.text,
            labours: _labourNumber,
            loads: _loadsNumber,
            dropOffPhone: _dropOffNumber.text,
            dropoffadress: _dropOffAdress,
            itemsToBeDelivered: _specialNote.text,
            paymentType: 'Online Payment',
            pickUpCellphone: _pickUpNumber.text,
            pickUpName: _pickUpname.text,
            pickupadress: _pickUpAdress,
            status: 'Awaiting Driver',
            trackNumber: 'DropT5903N12',
            vehicle: _vehicleType,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const MainActivityScreen(),
          ),
        );
      }
    });

    // Map<Booking> bookingDetails = {

    // };
  }
}
