import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/parcel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ParcelContainerWideget extends StatelessWidget {
  final TextEditingController massTextController;
  final TextEditingController lenghtTextController;
  final TextEditingController widthTextController;
  final TextEditingController heightTextController;
  final VoidCallback onTapEnvelope;
  final VoidCallback onTapEn;
  final VoidCallback onTapEnn;
  final VoidCallback onTappEn;
  final bool isSelectedEnvelope;
  final bool isSelectedEn;
  final bool isSelectedEnn;
  final bool isSelecteddEn;

  const ParcelContainerWideget(
      {super.key,
      required this.massTextController,
      required this.lenghtTextController,
      required this.widthTextController,
      required this.heightTextController,
      required this.onTapEnvelope,
      required this.onTapEn,
      required this.onTapEnn,
      required this.onTappEn,
      required this.isSelectedEnvelope,
      required this.isSelectedEn,
      required this.isSelectedEnn,
      required this.isSelecteddEn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: const Color.fromARGB(255, 255, 254, 254),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(children: [
            Container(
              height: 30,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Parcel 1',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        label: 'Mass',
                        textController: massTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        label: 'Length',
                        textController: lenghtTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        label: 'Width',
                        textController: widthTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        label: 'Height',
                        textController: heightTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: ParcelWidget(isSelected: isSelectedEnvelope),
                        onTap: onTapEnvelope,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: ParcelWidget(isSelected: isSelectedEn),
                        onTap: onTapEn,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: ParcelWidget(
                          isSelected: isSelectedEnn,
                        ),
                        onTap: onTapEnn,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: ParcelWidget(
                          isSelected: isSelecteddEn,
                        ),
                        onTap: onTappEn,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
