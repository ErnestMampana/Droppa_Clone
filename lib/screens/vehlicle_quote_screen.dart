import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/vehicle_select.dart';
import 'package:flutter/material.dart';

class VehicleQuoteScreen extends StatefulWidget {
  const VehicleQuoteScreen({Key? key}) : super(key: key);

  @override
  State<VehicleQuoteScreen> createState() => _VehicleQuoteScreenState();
}

class _VehicleQuoteScreenState extends State<VehicleQuoteScreen> {
  int _groupValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Vehicle Quotes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
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
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 219, 8, 8),
                    ),
                    //color: Colors.black54,
                    child: const Center(
                      child: Text(
                        'Select Vehicle Type',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: 'Mini Van',
                    description:
                        'Nissan NP 200 , Chevrolet \n        Utility or Similar',
                    imageUrl: Strings.minivanUlr,
                    itemNumber: 1,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      print('Mini van ton selected');
                      // setState(() {
                      //   _groupValue = itemNumber;
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: '1 Ton',
                    description: 'Toyota Hilux , Nissan NP300\n     or Similar',
                    imageUrl: Strings.oneTon,
                    itemNumber: 2,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      print('1 ton ton selected');
                      // setState(() {
                      //   _groupValue = itemNumber;
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: '1.5 Ton',
                    description: 'Hyndai H100 , Kia K2700\n     or Similar',
                    imageUrl: Strings.onePointFiveTon,
                    itemNumber: 3,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      print('1.5 ton selected');
                      // setState(() {
                      //   _groupValue = itemNumber;
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: '4 Ton',
                    description: 'Toyota Dyna , Isuzu NMR250\n      or Similar',
                    imageUrl: Strings.fourTon,
                    itemNumber: 4,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      print('4 ton selected');
                      // setState(() {
                      //   _groupValue = itemNumber;
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: '8 Ton',
                    description: 'Hino , Man , or Similar',
                    imageUrl: Strings.eightTon,
                    itemNumber: 5,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      print('$itemNumber 8 ton selected');
                      // setState(() {
                      //   _groupValue = itemNumber;
                      // });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
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
              RsButton(title: 'Confirm booking', radisNumber: 5, onTaped: () {})
            ],
          ),
        ),
      ),
    );
  }
}
