import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParcelWidget extends StatelessWidget {
  final bool isSelected;
  const ParcelWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color:
            isSelected ? Colors.blue : const Color.fromARGB(255, 255, 254, 254),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 7,
          ),
          Image.asset(
            'assets/box1.png',
            fit: BoxFit.fitHeight,
            height: 20,
          ),
          Text(
            'Envelope Size',
            style: TextStyle(
              fontSize: 9,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            '22*11*0.1 cm',
            style: TextStyle(
              fontSize: 9,
              color: isSelected ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
