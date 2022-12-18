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
  const EditItineraryScreen({super.key});

  @override
  State<EditItineraryScreen> createState() => _EditItineraryScreenState();
}

class _EditItineraryScreenState extends State<EditItineraryScreen> {
  //Variables
  bool _isSwitched = false;
  int _labourNumber = 1;
  int _loadsNumber = 1;

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
                  const Text(
                    'R 1 214,00',
                    style: TextStyle(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditItineraryScreen(),
                    ),
                  );
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
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.my_location_outlined,
                              color: Colors.blue,
                              size: 30,
                            ),
                            Column(
                              children: const [
                                Text('Pick-up Details'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '5099 Skosana St, Orlando East, Soweto, 1804, \nSouth Africa'),
                              ],
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
                            Column(
                              children: const [
                                Text('Drop-off Details'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '5099 Skosana St, Orlando East, Soweto, 1804, \nSouth Africa'),
                              ],
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
            const PickUpAndDrop(
              title: 'Pick-up Details',
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
                });
              },
              onTapMinus: _labourNumber == 1
                  ? null
                  : () {
                      setState(() {
                        _labourNumber -= 1;
                      });
                    },
            ),
            const SizedBox(
              height: 10,
            ),
            const PickUpAndDrop(
              title: 'Drop-off Details',
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
                });
              },
              onTapMinus: _loadsNumber == 1
                  ? null
                  : () {
                      setState(() {
                        _loadsNumber -= 1;
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
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      //height: 100,
                      child: TextField(
                        decoration: InputDecoration(
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
}
