import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/screens/edit_itinenrary_screen.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/vehicle_select.dart';
import 'package:flutter/material.dart';

class VehicleQuoteScreen extends StatefulWidget {
  final double? price;
  final String? pickUpAdress;
  final String? dropOffAdress;
  const VehicleQuoteScreen(
      {Key? key,
      required this.price,
      required this.pickUpAdress,
      required this.dropOffAdress})
      : super(key: key);

  @override
  State<VehicleQuoteScreen> createState() => _VehicleQuoteScreenState();
}

class _VehicleQuoteScreenState extends State<VehicleQuoteScreen> {
  int _groupValue = 1;
  late double _totalPrice;
  late String _vehicleType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _totalPrice = widget.price! + LookUp.minivanPrice;
    _vehicleType = 'Mini-Van';
  }

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                            child: Text(widget.pickUpAdress!)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                            child: Text(widget.dropOffAdress!)),
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
                      _handlePriceCalculations(itemNumber!);
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
                      _handlePriceCalculations(itemNumber!);
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
                      _handlePriceCalculations(itemNumber!);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SelectVehicleController(
                    title: '4 Ton',
                    description: 'Toyota Dyna , Isuzu \n      or Similar',
                    imageUrl: Strings.fourTon,
                    itemNumber: 4,
                    groupValue: _groupValue,
                    onChanged: (itemNumber) {
                      _handlePriceCalculations(itemNumber!);
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
                      _handlePriceCalculations(itemNumber!);
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
                  title: 'Confirm booking',
                  radisNumber: 5,
                  onTaped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => userPersonalDetailsDTO == null
                            ? const LoginScreen()
                            : EditItineraryScreen(
                                dropOffAdress: widget.dropOffAdress!,
                                pickUpAdress: widget.pickUpAdress!,
                                quotePrice: _totalPrice,
                                vehicleType: _vehicleType,
                              ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  _handlePriceCalculations(int item) {
    setState(() {
      _groupValue = item;
      if (item == 1) {
        _vehicleType = 'Mini-Van';
        _totalPrice = widget.price! + LookUp.minivanPrice;
      } else if (item == 2) {
        _vehicleType = '1-ton';
        _totalPrice = widget.price! + LookUp.oneTonVanPrice;
      } else if (item == 3) {
        _vehicleType = '1.5-ton';
        _totalPrice = widget.price! + LookUp.pointFivePrice;
      } else if (item == 4) {
        _vehicleType = '4-ton';
        _totalPrice = widget.price! + LookUp.fourTonTruckPrice;
      } else if (item == 5) {
        _vehicleType = '8-ton';
        _totalPrice = widget.price! + LookUp.eightTonTruckPrice;
      }
    });
  }
}
