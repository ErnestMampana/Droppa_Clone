import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateAndTime extends StatefulWidget {
  final IconData icon;
  final String title;
  const DateAndTime({super.key, required this.icon, required this.title});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  widget.icon,
                  color: Colors.blue,
                  size: 40,
                ),
              ],
            ),
            Row(
              children: [
                Text(widget.title),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
