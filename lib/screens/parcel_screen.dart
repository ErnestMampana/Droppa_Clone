import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/material.dart';

class ParcelScreen extends StatefulWidget {
  const ParcelScreen({Key? key}) : super(key: key);

  @override
  State<ParcelScreen> createState() => _ParcelScreenState();
}

class _ParcelScreenState extends State<ParcelScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Parcel'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color.fromARGB(255, 252, 249, 249),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  'Enter Information below',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: const Color.fromARGB(255, 255, 254, 254),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(children: [
                    Container(
                      height: 30,
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Parcel 1',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RentalTextField(label: 'Mass'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RentalTextField(label: 'Length'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RentalTextField(label: 'Width'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RentalTextField(label: 'Height'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color:
                                      const Color.fromARGB(255, 255, 254, 254),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/box1.png',
                                          fit: BoxFit.scaleDown),
                                      const Text('Envelope Size'),
                                      const Text('22*11*0.1 cm')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color:
                                      const Color.fromARGB(255, 255, 254, 254),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/box1.png',
                                          fit: BoxFit.scaleDown),
                                      const Text('Envelope Size'),
                                      const Text('22*11*0.1 cm')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color:
                                      const Color.fromARGB(255, 255, 254, 254),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/box1.png',
                                          fit: BoxFit.scaleDown),
                                      const Text('Envelope Size'),
                                      const Text('22*11*0.1 cm')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color:
                                      const Color.fromARGB(255, 255, 254, 254),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/box1.png',
                                          fit: BoxFit.scaleDown),
                                      const Text('Envelope Size'),
                                      const Text('22*11*0.1 cm')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Row(
      //       children: [
      //         Flexible(
      //           child: Text(Strings.finalBilling),
      //         ),
      //         Checkbox(
      //           value: value,
      //           onChanged: (value) {
      //             setState(() {
      //               this.value = value!;
      //             });
      //           },
      //         ),
      //       ],
      //     ),
      //     RsButton(title: 'Done', radisNumber: 6, onTaped: () {}),
      //   ],
      // ),
    );
  }
}
