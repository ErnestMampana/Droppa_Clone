import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io' show Platform;

class PickUpAndDrop extends StatefulWidget {
  final String title;
  const PickUpAndDrop({super.key, required this.title});

  @override
  State<PickUpAndDrop> createState() => _PickUpAndDropState();
}

class _PickUpAndDropState extends State<PickUpAndDrop> {
  bool _isSwitched = false;
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
                widget.title,
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
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Text('I will be at the Pick-up'),
                ],
              ),
              Row(
                children: [
                  Platform.isIOS
                      ? CupertinoSwitch(
                          value: _isSwitched,
                          onChanged: (value) {
                            _isSwitched = value;
                            setState(
                              () {},
                            );
                          },
                          thumbColor: Colors.white,
                          activeColor: Colors.blue,
                        )
                      : Switch(
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(
                              () {
                                _isSwitched = value;
                              },
                            );
                          },
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
          const SizedBox(
            width: 350,
            height: 30,
            child: TextField(),
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
          const SizedBox(
            width: 350,
            height: 30,
            child: TextField(),
          ),
        ],
      ),
    );
  }
}
