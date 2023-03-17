// ignore_for_file: use_build_context_synchronously

import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/bookings_screen.dart';
import 'package:droppa_clone/screens/login_screen.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../LookUp/lookup.dart';
import '../screens/main_activty_screen.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  final WebApiDataService _userService = WebApiDataService();
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
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color.fromARGB(255, 20, 204, 201),
                    child: Text(
                      userPersonalDetailsDTO == null
                          ? 'DU'
                          : userPersonalDetailsDTO!.userName!.substring(0, 1) +
                              userPersonalDetailsDTO!.surname!.substring(0, 1),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  userPersonalDetailsDTO != null
                      ? Text(
                          '${userPersonalDetailsDTO!.userName} '
                          ' ${userPersonalDetailsDTO!.surname!}',
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Droppa User      ',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ),
          ),
          userPersonalDetailsDTO != null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        child: const SizedBox(
                          height: 25,
                          width: 250,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        child: Container(
                          width: 250,
                          height: 25,
                          color: Colors.blue,
                          child: const Text(
                            'Bookings',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BookingsScreen(),
                            ),
                          );
                          //Navigator.pop(context);
                        },
                      ),
                    ),

                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        child: const SizedBox(
                          width: 250,
                          height: 25,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        child: const SizedBox(
                          width: 250,
                          height: 25,
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
                    // const Divider(
                    //   thickness: 1,
                    // ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: GestureDetector(
                    child: const SizedBox(
                      height: 25,
                      child: Text(
                        'More menu when you log in',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 16, 2),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: GestureDetector(
              child: const SizedBox(
                height: 25,
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                child: const SizedBox(
                  height: 25,
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
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: GestureDetector(
              child: SizedBox(
                height: 25,
                child: Text(
                  userPersonalDetailsDTO == null ? 'Sign In' : 'Sign Out',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                if (userPersonalDetailsDTO == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                } else {
                  _handleLogout();
                }

                //Navigator.pop(context);
              },
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

  void _handleLogout() async {
    DialogUtils.showLoading(context);
    var response = await _userService.logOut();
    if (response.statusCode == 200) {
      DialogUtils.hideDialog(context);
      userPersonalDetailsDTO =  null;
      context.read<AppData>().clearBooking();
      context.read<AppData>().changePrice(00.0);
      //Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MainActivityScreen(),
        ),
      );
    }
  }
}
