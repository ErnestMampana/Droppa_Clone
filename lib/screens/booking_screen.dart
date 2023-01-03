import 'package:droppa_clone/widgets/booking_address.dart';
import 'package:droppa_clone/widgets/booking_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Booking'),
        centerTitle: true,
        actions: const [
          Icon(Icons.chat),
        ],
      ),
      bottomNavigationBar: Container(
        height: 150,
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Total Price',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'ZAR 1354,00',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {
                    //_handleSignUp();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const LoginScreen(),
                    //   ),
                    // );
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  minWidth: 180,
                  child: const Text(
                    'Cancel Booking',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //_handleSignUp();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => const LoginScreen(),
                    //   ),
                    // );
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  minWidth: 180,
                  child: const Text(
                    'Update date',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 400,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'MINI_VAN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const BookingAddress(
                      iconcolor: Colors.green, title: 'Pick-up Details'),
                  const BookingAddress(
                    iconcolor: Colors.blue,
                    title: 'Drop-off Details',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const BookingDetails(
                      title: 'Pick-up date', details: '2022-12-24'),
                  const BookingDetails(
                      title: 'Payment type', details: 'ONLINE_PAY'),
                  const BookingDetails(title: 'Time', details: '11:30 AM'),
                  const BookingDetails(title: 'Loads', details: '1'),
                  const BookingDetails(title: 'Labours', details: '1'),
                  const BookingDetails(
                      title: 'Status', details: 'Awaiting payments'),
                  const BookingDetails(
                      title: 'Track Number', details: 'GAU149080'),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                      //height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
