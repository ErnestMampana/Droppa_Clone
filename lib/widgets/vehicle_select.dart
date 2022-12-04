import 'package:flutter/material.dart';

class SelectVehicleController extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int itemNumber;
  final int groupValue;
  final Function onChanged;
  const SelectVehicleController(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.itemNumber,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  State<SelectVehicleController> createState() =>
      _SelectVehicleControllerState();
}

class _SelectVehicleControllerState extends State<SelectVehicleController> {
  String? _imageUrl;
  String? _description;
  String? _title;
  int? _itemNumber;
  int? _groupValue;
  Function? _onChanged;

  @override
  void initState() {
    _imageUrl = widget.imageUrl;
    _description = widget.description;
    _title = widget.title;
    _groupValue = widget.groupValue;
    _itemNumber = widget.itemNumber;
    _onChanged = widget.onChanged;

    super.initState();
  }

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
            _imageUrl!,
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
                  _title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                _description!,
              ),
            ],
          ),
          Radio(
            value: _itemNumber,
            groupValue: _groupValue,
            onChanged: _onChanged!(_itemNumber),
            activeColor: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
