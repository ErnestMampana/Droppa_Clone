import 'package:flutter/material.dart';

class ParcelSize extends StatelessWidget {
  const ParcelSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: const Color.fromARGB(255, 255, 254, 254),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/box1.png', fit: BoxFit.scaleDown),
            const Text('Envelope Size'),
            const Text('22*11*0.1 cm')
          ],
        ),
      ),
    );
  }
}
