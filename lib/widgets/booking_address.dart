import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookingAddress extends StatelessWidget {
  final String title;
  final Color iconcolor;
  const BookingAddress(
      {super.key, required this.title, required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$title',
                style: TextStyle(
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
                child: Text(
                    '852 kobus st,Silverton, Pretoria, 0184, South Africa'),
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
                children: [Icon(Icons.person), Text('Ernest Mampana')],
              ),
              Row(
                children: [Icon(Icons.call), Text('0976656083')],
              ),
            ],
          )
        ],
      ),
    );
  }
}
