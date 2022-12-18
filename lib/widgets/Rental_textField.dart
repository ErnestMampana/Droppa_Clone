import 'package:flutter/material.dart';

class RentalTextField extends StatelessWidget {
  final String label;
  const RentalTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            label,
            textAlign: TextAlign.start,
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          autocorrect: false,
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.symmetric(vertical: 2.0),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
