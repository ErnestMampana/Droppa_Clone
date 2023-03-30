import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  final String title;
  final String details;
  const BookingDetails({super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(title),
              ],
            ),
            Row(
              children: [
                Text(details),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
