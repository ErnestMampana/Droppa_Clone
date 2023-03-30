import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/screens/courier_edit_itenery.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/widgets/courier_radio.dart';
import 'package:flutter/material.dart';

class CourierSecreen extends StatefulWidget {
  const CourierSecreen({super.key});

  @override
  State<CourierSecreen> createState() => _CourierSecreenState();
}

class _CourierSecreenState extends State<CourierSecreen> {
  int _groupValue = 1;
  String _deliveryEstimate = '1 - 3 Working days';
  String? _pickUpAddress;
  String? _dropOffAddress;
  double _price = 0;
  double _totalPrice = 0;

  @override
  void initState() {
    _price = LookUp.courierPrice;
    _pickUpAddress = LookUp.courierPickUpAddress;
    _dropOffAddress = LookUp.courierDropOffAddress;
    _totalPrice = _price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Courier'),
        centerTitle: true,
        elevation: 0,
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
                  height: MediaQuery.of(context).size.height * 0.25,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                            height: 65,
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
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    _pickUpAddress!,
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
                            const Icon(
                              Icons.my_location_outlined,
                              color: Color.fromARGB(255, 226, 13, 13),
                              size: 30,
                            ),
                            SizedBox(
                              height: 65,
                              width: 300,
                              child: Column(
                                children: [
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Drop-Off Details',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select your service',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CourierRadioCard(
                groupValue: _groupValue,
                value: 1,
                courierType: 'Express courier',
                courierDeliveryEstimate: '1 - 3 Working days',
                price: _price + 100.00,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value!;
                    _deliveryEstimate = '1 - 3 Working days';
                    _totalPrice += 100;
                  });
                }),
            CourierRadioCard(
                groupValue: _groupValue,
                value: 2,
                courierType: 'Budget courier',
                courierDeliveryEstimate: '2 - 5 Working days',
                price: _price + 200.00,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value!;
                    _deliveryEstimate = '2 - 5 Working days';
                    _totalPrice += 200;
                  });
                }),
            CourierRadioCard(
              groupValue: _groupValue,
              value: 3,
              courierType: 'Tender Document',
              courierDeliveryEstimate: 'Premium Delivery Service',
              price: _price + 1000.00,
              onChanged: (value) {
                setState(() {
                  _groupValue = value!;
                  _deliveryEstimate = 'Premium Delivery Service';
                  _totalPrice += 1000;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => userPersonalDetailsDTO == null
                          ? const LoginScreen()
                          : CourierEditIteneraryScreen(
                              deliveryEstimate: _deliveryEstimate,
                              price: _totalPrice,
                            ),
                    ),
                  );
                },
                color: Colors.blue,
                child: const Text('Confirm booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
