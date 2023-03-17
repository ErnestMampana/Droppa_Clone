// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/bookings_screen.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/widgets/booking_address.dart';
import 'package:droppa_clone/widgets/booking_details.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatefulWidget {
  final BookingItem booking;
  const BookingScreen({
    Key? key,
    required this.booking,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _specialNote = TextEditingController(text: _notes);

  static String? _notes;

  final UserService _userService = UserService();

  @override
  void initState() {
    _notes = widget.booking.itemsToBeDelivered;
    super.initState();
  }

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
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    'ZAR ${widget.booking.bookingPrice}',
                    style: const TextStyle(
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
                  onPressed: () async {
                    DialogUtils.showLoading(context);
                    var response = await _userService.cancelBooking(
                        widget.booking.bookingId, widget.booking.userId);
                    DialogUtils.hideDialog(context);
                    if (response.status == 'CANCELLED') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookingsScreen(),
                        ),
                      );
                    }
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
                    child: Center(
                      child: Text(
                        '${widget.booking.vehicle}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  BookingAddress(
                    iconcolor: Colors.green,
                    title: 'Pick-up Details',
                    address: '${widget.booking.pickupadress}',
                    contact: '${widget.booking.pickUpCellphone}',
                    name: '${widget.booking.pickUpName}',
                  ),
                  BookingAddress(
                    iconcolor: Colors.blue,
                    title: 'Drop-off Details',
                    address: '${widget.booking.dropoffadress}',
                    contact: '${widget.booking.dropOffPhone}',
                    name: '${widget.booking.dropOffName}',
                  ),
                  const SizedBox(
                    height: 10,
                    child: Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookingDetails(
                      title: 'Pick-up date', details: '${widget.booking.date}'),
                  BookingDetails(
                      title: 'Payment type',
                      details: '${widget.booking.paymentType}'),
                  BookingDetails(
                      title: 'Time', details: '${widget.booking.time}'),
                  BookingDetails(
                      title: 'Loads', details: '${widget.booking.loads}'),
                  BookingDetails(
                      title: 'Labours', details: '${widget.booking.labours}'),
                  BookingDetails(
                      title: 'Status', details: '${widget.booking.status}'),
                  BookingDetails(
                      title: 'Track Number',
                      details: '${widget.booking.trackNumber}'),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      //height: 100,
                      child: TextField(
                        enabled: false,
                        controller: _specialNote,
                        decoration: const InputDecoration(
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
