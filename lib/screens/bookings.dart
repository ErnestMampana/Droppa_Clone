import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/screens/booking.dart';
import 'package:droppa_clone/widgets/bookings_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  List<Map<String, dynamic>> _bookings = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Bookings'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return BookingsDetails();
          },
          itemCount: Booking.bookings.length,
        ));
  }
}
