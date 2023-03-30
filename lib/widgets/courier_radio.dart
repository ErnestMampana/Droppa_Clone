import 'package:flutter/material.dart';

class CourierRadioCard extends StatelessWidget {
  final String courierType;
  final String courierDeliveryEstimate;
  final double price;
  final Function(int?)? onChanged;
  final int value;
  final int groupValue;
  const CourierRadioCard(
      {super.key,
      required this.courierType,
      required this.courierDeliveryEstimate,
      required this.price,
      required this.onChanged,
      required this.value,
      required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //color: Colors.green,
      height: MediaQuery.of(context).size.height * 0.10,
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/dropskyflight.png',
                    fit: BoxFit.scaleDown,
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            courierType,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(courierDeliveryEstimate))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'R $price',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
              Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ],
          )
        ],
      ),
    );
  }
}
