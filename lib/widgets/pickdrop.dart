import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io' show Platform;

class PickUpAndDrop extends StatelessWidget {
  final String title;
  final String pickUpOrDrop;
  final TextEditingController nameController;
  final TextEditingController numberController;
  final bool nameValid;
  final bool numberValid;
  final void Function(bool?)? onChanged;
  final bool isSwitched;
  const PickUpAndDrop(
      {super.key,
      required this.title,
      required this.pickUpOrDrop,
      required this.nameController,
      required this.numberController,
      required this.nameValid,
      required this.numberValid,
      required this.onChanged,
      required this.isSwitched});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 225,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text("I will be at the $pickUpOrDrop"),
                ],
              ),
              Row(
                children: [
                  Platform.isIOS
                      ? CupertinoSwitch(
                          value: isSwitched,
                          onChanged: onChanged,
                          thumbColor: Colors.white,
                          activeColor: Colors.blue,
                        )
                      : Switch(
                          value: isSwitched,
                          onChanged: onChanged,
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Divider(
            color: Colors.black,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Name and Surname',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(
              width: 350,
              height: 30,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  errorText: nameValid ? 'Required field' : null,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Phone Number',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(
              width: 350,
              height: 30,
              child: TextField(
                controller: numberController,
                decoration: InputDecoration(
                  errorText: numberValid ? 'Required field' : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
