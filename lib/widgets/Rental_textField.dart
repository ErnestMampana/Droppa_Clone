// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RentalTextField extends StatelessWidget {
  final String label;
  final bool textValid;
  final TextEditingController textController;
  final VoidCallback onTap;
  const RentalTextField(
      {Key? key,
      required this.label,
      required this.textController,
      required this.textValid,
      required this.onTap})
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
          onTap: onTap,
          //keyboardType: TextInputType.number,
          controller: textController,
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
            errorText: textValid ? 'Required field' : null,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
