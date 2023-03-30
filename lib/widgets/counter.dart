import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final int number;
  final VoidCallback? onTapPlus;
  final VoidCallback? onTapMinus;
  const Counter(
      {super.key,
      required this.number,
      required this.onTapPlus,
      required this.onTapMinus});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.onTapMinus,
            child: const Icon(Icons.remove),
          ),
          Text(
            widget.number.toString(),
          ),
          GestureDetector(
            onTap: widget.onTapPlus,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
