import 'package:flutter/material.dart';

class BookingAddress extends StatelessWidget {
  final String title;
  final Color iconcolor;
  final String address;
  final String name;
  final String contact;
  const BookingAddress(
      {super.key,
      required this.title,
      required this.iconcolor,
      required this.address,
      required this.name,
      required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: iconcolor,
                size: 35,
              ),
              Expanded(
                child: Text(address),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(name),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.call),
                  Text(contact),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
