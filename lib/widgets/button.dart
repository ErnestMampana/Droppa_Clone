import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RsButton extends StatelessWidget {
  final String title;
  final double radisNumber;
  final Function onTaped;
  const RsButton(
      {Key? key,
      required this.title,
      required this.radisNumber,
      required this.onTaped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTaped(),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radisNumber)),
      elevation: 0,
      minWidth: double.maxFinite,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
