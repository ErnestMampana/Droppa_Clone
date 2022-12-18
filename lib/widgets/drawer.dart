import 'package:droppa_clone/screens/bookings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 20, 204, 201),
                    child: Text(
                      'D',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ernest Mampana',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  'History',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: Container(
              width: 200,
              height: 25,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Bookings',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingsScreen(),
                ),
              );
            },
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  'Rentals',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  'Wallet',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  'FAQs',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  "T & C's",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          GestureDetector(
            child: const SizedBox(
              height: 25,
              child: Center(
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const Center(
            child: Text(
              'Droppa\nUnit 14, First Floor\nRight,Berkley Office Park\n8 Bauhinia Street\nHighveld Technopark\nCenturion',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
