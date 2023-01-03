import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtomSheetWidget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final TextEditingController conpanyNameTextController;
  final TextEditingController buildingNumberController;
  final TextEditingController unitNumberController;
  final TextEditingController streetTextController;
  final TextEditingController postalTextController;
  final TextEditingController suburbTextController;
  final TextEditingController provinceTextController;
  final Function onPress;
  final VoidCallback onCancel;
  const ButtomSheetWidget({
    Key? key,
    required this.onChanged,
    required this.conpanyNameTextController,
    required this.buildingNumberController,
    required this.unitNumberController,
    required this.streetTextController,
    required this.postalTextController,
    required this.suburbTextController,
    required this.provinceTextController,
    required this.onPress,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      color: Colors.grey[400],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  InkWell(
                    onTap: onCancel,
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  height: 750,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'Please note that this service is for BUDGET COURIER & EXPRESS COURIER',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField(
                          hint: const Text(
                            'Address Type',
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 7,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          items: LookUp.adressType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: onChanged,
                          // (dynamic value) {
                          //   setState(() {
                          //     FocusScope.of(context).requestFocus(FocusNode());
                          //   });
                          // },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RentalTextField(
                          label: 'Company Name(Optional)',
                          textController: conpanyNameTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          Expanded(
                            child: TextField(
                              controller: buildingNumberController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 7),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              controller: unitNumberController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 7),
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 15,
                        ),
                        RentalTextField(
                          label: 'Street Address',
                          textController: streetTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RentalTextField(
                          label: 'Postal Code',
                          textController: postalTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RentalTextField(
                          label: 'Suburb',
                          textController: suburbTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RentalTextField(
                          label: 'Province',
                          textController: provinceTextController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RsButton(
                          title: 'Done',
                          radisNumber: 12,
                          onTaped: onPress,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 30,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 40, 63, 73),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Address Information',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
