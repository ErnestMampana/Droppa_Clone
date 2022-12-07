import 'package:flutter/material.dart';

class SelectVehicleController extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int itemNumber;
  final int groupValue;
  final Function(int?)? onChanged;
  const SelectVehicleController(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.itemNumber,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  // String? _imageUrl;

  // String? _description;

  // String? _title;

  // int? _itemNumber;

  // int? _groupValue;

  //Function(int)? _onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            imageUrl,
            //fit: BoxFit.scaleDown,
            height: 120,
            width: 120,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
              ),
            ],
          ),
          Radio(
            value: itemNumber,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
