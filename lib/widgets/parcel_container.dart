import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/parcel.dart';
import 'package:flutter/material.dart';

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
  final bool massValid;
  final bool lengthValid;
  final bool heightValid;
  final bool widthValid;
  final VoidCallback onTapHeight;
  final VoidCallback onTapWidth;
  final VoidCallback onTapLength;
  final VoidCallback onTapMass;
  final int number;

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
      required this.isSelecteddEn,
      required this.massValid,
      required this.lengthValid,
      required this.heightValid,
      required this.widthValid,
      required this.onTapHeight,
      required this.onTapWidth,
      required this.onTapLength,
      required this.onTapMass, required this.number});

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
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Parcel $number',
                      style: const TextStyle(
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
                        onTap: onTapMass,
                        textValid: massValid,
                        label: 'Mass',
                        textController: massTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        onTap: onTapLength,
                        textValid: lengthValid,
                        label: 'Length',
                        textController: lenghtTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        onTap: onTapWidth,
                        textValid: widthValid,
                        label: 'Width',
                        textController: widthTextController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RentalTextField(
                        onTap: onTapHeight,
                        textValid: heightValid,
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
