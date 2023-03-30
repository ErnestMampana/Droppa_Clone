import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CourierPickDropWidget extends StatelessWidget {
  final String title;
  final String pickUpOrDrop;
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController companyNameController;
  final TextEditingController suburbController;
  final bool nameValid;
  final bool numberValid;
  final void Function(bool?)? onChanged;
  final bool isSwitched;
  const CourierPickDropWidget(
      {super.key,
      required this.title,
      required this.pickUpOrDrop,
      required this.nameController,
      required this.numberController,
      required this.nameValid,
      required this.numberValid,
      this.onChanged,
      required this.isSwitched,
      required this.companyNameController,
      required this.suburbController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.46,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
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
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "I will be at the $pickUpOrDrop",
                ),
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
              ],
            ),
          ),
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
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Company name(Optional)',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(
              width: 350,
              height: 30,
              child: TextField(
                controller: companyNameController,
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
                'Confirm Suburb',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SizedBox(
              width: 350,
              height: 30,
              child: TextField(
                controller: suburbController,
                decoration: InputDecoration(
                  errorText: nameValid ? 'Required field' : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
