// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/screens/booking_screen.dart';
import 'package:droppa_clone/screens/bookings_screen.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/screens/quote_request_screen.dart';
import 'package:droppa_clone/screens/rental_service_screen.dart';
import 'package:droppa_clone/screens/vehlicle_quote_screen.dart';
import 'package:droppa_clone/screens/wallet_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/drawer.dart';
import 'package:droppa_clone/widgets/vehicle_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({Key? key}) : super(key: key);

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  late int _numberOfBookings;

  @override
  void initState() {
    super.initState();
    _numberOfBookings = LookUp.bookings.length;
    userPersonalDetailsDTO;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Droppa'),
        centerTitle: true,
        actions: const [
          Icon(Icons.chat),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  //margin: const EdgeInsets.all(10.0),
                  //alignment: Alignment.centerLeft,
                  width: 370,
                  padding: const EdgeInsets.all(20),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      //droppa image here
                      const Image(
                        // image: NetworkImage(
                        //     'https://lh3.googleusercontent.com/E_9LY-jbheMRrdo6kJnTfwsehRWhgXul_E9Y14hRiY5RLqJWY33gDSF6tj21l6rxiOT6WLT3rbAra44RpTF1JbeGjW-aJEcG1XQ=w400-h350-rw'),
                        image: ExactAssetImage('assets/droo.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                      Row(children: [
                        const Text(
                          'Current status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ]),
                      const Divider(
                        color: Colors.blue,
                        thickness: 2.5,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text(
                                Strings.bookingStatus,
                                style: const TextStyle(fontSize: 11),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const BookingScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  Strings.noBooking,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ]),
                            const VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Column(children: [
                              Text(
                                Strings.totBooking,
                                style: const TextStyle(fontSize: 11),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const BookingsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  '$_numberOfBookings',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ]),
                            const VerticalDivider(
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Column(children: [
                              Text(
                                Strings.walletText,
                                style: const TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                child: Consumer<AppData>(
                                  builder: (context, value, child) {
                                    return Text(
                                      'R ${value.walletPrice}',
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.blue,
                                      ),
                                    );
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const WalletScreen(),
                                    ),
                                  );
                                },
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  //margin: const EdgeInsets.all(10.0),
                  color: Colors.transparent,
                  child: Row(children: [
                    const Text(
                      'Select Service',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuoteRequestScreen(
                                title: 'Courier',
                                description:
                                    'A range of time sensitive delivery options for you to choose from.',
                              ),
                            ),
                          );
                        });
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: Image.asset('assets/skynet.png',
                                    fit: BoxFit.scaleDown),
                              ),
                              title: const Text('COURIER'),
                              subtitle: const Text(
                                  'A range of courier options at\naffordable prices'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuoteRequestScreen(
                                title: 'Fleet',
                                description:
                                    'select the dedicated vehicle that suits your needs.',
                              ),
                            ),
                          );
                        });
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: Image.asset('assets/dropalogo.jpg',
                                    fit: BoxFit.scaleDown),
                              ),
                              title: const Text('FLEET'),
                              subtitle: const Text(
                                  'A range of dedicated vehicles that suits your load'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RentalServiceScreen(),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: Image.asset('assets/elite.png',
                                    fit: BoxFit.scaleDown),
                              ),
                              title: const Text('RENTALS'),
                              subtitle: const Text(
                                  'A range of bakkies and trucks to rent for up to 21 days'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RsButton(
                  title: 'Track Booking',
                  radisNumber: 30,
                  onTaped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
