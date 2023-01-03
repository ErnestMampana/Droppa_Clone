import 'package:flutter/material.dart';

class RentalTextField extends StatelessWidget {
  final String label;
  final TextEditingController textController;
  const RentalTextField(
      {Key? key, required this.label, required this.textController})
      : super(key: key);

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
        TextField(
          controller: textController,
          autocorrect: false,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
