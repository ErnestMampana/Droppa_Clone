import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/booking.dart';
import 'package:droppa_clone/screens/booking_screen.dart';
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
  void initState() {
    // TODO: implement initState
    // print(Booking.bookings.);
    setState(() {
      //vancanciesFuture = _getVacancies();

      _bookings.clear();
      for (var booking in LookUp.bookings) {
        _bookings.add(booking.toMap());
      }
      //_runFilter();
      debugPrint(_bookings.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Bookings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: LookUp.bookings.isEmpty
          ? const Center(
              child: Text(
                "No Bookings Found",
                textAlign: TextAlign.center,
                style: TextStyle(
                  //fontFamily: GlobalUI.FONT_MEDIUM,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            )
          : ListView.builder(
              itemCount: LookUp.bookings.length,
              itemBuilder: (context, index) {
                // if () {
                return _bookingItem(
                  BookingItem.fromJson(
                    _bookings[index],
                  ),
                );
              },
            ),
    );
  }

  Widget _bookingItem(BookingItem bookingData) {
    return Container(
      height: 250,
      width: 400,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Saturday,Dec 24,2022',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.Spa,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 25,
                        ),
                        // Flexible(
                        //   child:
                        SizedBox(
                          width: 250,
                          child: Text(bookingData.pickupadress!),
                        ),
                        //  ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: RichText(
                              text: const TextSpan(
                                text: '---',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.Spa,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 25,
                        ),
                        // Flexible(
                        //   child:
                        SizedBox(
                          width: 250,
                          child: Text(bookingData.dropoffadress!),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Container(
                  height: 100,
                  width: 70,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      bookingData.vehicle!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              Text('${bookingData.date}'),
              Text('${bookingData.date}'),
              Text('${bookingData.time}'),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text(
              bookingData.status!,
              style: const TextStyle(fontSize: 17, color: Colors.blue),
            ),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingScreen(booking: bookingData),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
