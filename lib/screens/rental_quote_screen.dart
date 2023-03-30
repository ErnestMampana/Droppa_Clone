import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/screens/confirm_rental_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/vehicle_select.dart';
import 'package:flutter/material.dart';

class RentalQuoteScreen extends StatefulWidget {
  final double price;
  const RentalQuoteScreen({super.key, required this.price});

  @override
  State<RentalQuoteScreen> createState() => _RentalQuoteScreenState();
}

class _RentalQuoteScreenState extends State<RentalQuoteScreen> {
  //variables
  int _groupValue = 1;
  double? _totalPrice;
  double? _price;

  @override
  void initState() {
    _totalPrice = widget.price;
    _price = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
        elevation: 0,
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
                    'assets/elite.png',
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
                title: 'Confirm Rental',
                radisNumber: 5,
                onTaped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmRentalScreen(price: _totalPrice!),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 100,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        LookUp.truckType,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(
                          child: Text(
                            'Truck comes with a driver',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Kilos limited to 200km per day',
                            style: TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SelectVehicleController(
              title: '1 Ton',
              description: 'R ${_price! + 1500}',
              imageUrl: 'assets/elite1.png',
              itemNumber: 1,
              groupValue: _groupValue,
              onChanged: (itemNumber) {
                setState(() {
                  _groupValue = itemNumber!;
                  _totalPrice = _price! + 1500;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SelectVehicleController(
              title: '2.5 Ton',
              description: 'R ${_price! + 2000}',
              imageUrl: 'assets/elite2.5.png',
              itemNumber: 2,
              groupValue: _groupValue,
              onChanged: (itemNumber) {
                setState(() {
                  _groupValue = itemNumber!;
                  _totalPrice = _price! + 2000;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SelectVehicleController(
              title: '4 Ton',
              description: 'R ${_price! + 2500}',
              imageUrl: 'assets/elite4.png',
              itemNumber: 3,
              groupValue: _groupValue,
              onChanged: (itemNumber) {
                setState(() {
                  _groupValue = itemNumber!;
                  _totalPrice = _price! + 2500;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SelectVehicleController(
              title: '6 Ton',
              description: 'R ${_price! + 3000}',
              imageUrl: 'assets/elite6.png',
              itemNumber: 4,
              groupValue: _groupValue,
              onChanged: (itemNumber) {
                setState(() {
                  _groupValue = itemNumber!;
                  _totalPrice = _price! + 3000;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SelectVehicleController(
              title: '8 Ton',
              description: 'R ${_price! + 3500}',
              imageUrl: 'assets/elite7.png',
              itemNumber: 5,
              groupValue: _groupValue,
              onChanged: (itemNumber) {
                setState(() {
                  _groupValue = itemNumber!;
                  _totalPrice = _price! + 3500;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
