// ignore_for_file: use_build_context_synchronously

import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/backend/classes/Parcel.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/courier_screen.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/parcel_container.dart';
import 'package:flutter/material.dart';

class ParcelScreen extends StatefulWidget {
  const ParcelScreen({Key? key}) : super(key: key);

  @override
  State<ParcelScreen> createState() => _ParcelScreenState();
}

class _ParcelScreenState extends State<ParcelScreen> {
  // Variables
  bool value = false;
  bool _isSelectedEnvelope = false;
  bool _isSelectedEn = false;
  bool _isSelectedEnn = false;
  bool _isSelecteddEn = false;
  int _parcelNumber = 1;

  //Text Controllers
  final TextEditingController _massTextController = TextEditingController();
  final TextEditingController _lenghtTextController = TextEditingController();
  final TextEditingController _widthTextController = TextEditingController();
  final TextEditingController _heightTextController = TextEditingController();

  bool _heightValid = false;
  bool _lengthValid = false;
  bool _massValid = false;
  bool _widthValid = false;

  final _userService = UserService();

  @override
  void dispose() {
    _massTextController.dispose();
    _lenghtTextController.dispose();
    _widthTextController.dispose();
    _heightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Parcel'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: const Color.fromARGB(255, 252, 249, 249),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    'Enter Information below',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ParcelContainerWideget(
                onTapHeight: () {
                  setState(() {
                    _heightValid = false;
                  });
                },
                onTapLength: () {
                  setState(() {
                    _lengthValid = false;
                  });
                },
                onTapMass: () {
                  setState(() {
                    _massValid = false;
                  });
                },
                onTapWidth: () {
                  setState(() {
                    _widthValid = false;
                  });
                },
                number: _parcelNumber,
                heightValid: _heightValid,
                lengthValid: _lengthValid,
                massValid: _massValid,
                widthValid: _widthValid,
                massTextController: _massTextController,
                lenghtTextController: _lenghtTextController,
                widthTextController: _widthTextController,
                heightTextController: _heightTextController,
                isSelectedEnvelope: _isSelectedEnvelope,
                isSelectedEn: _isSelectedEn,
                isSelectedEnn: _isSelectedEnn,
                isSelecteddEn: _isSelecteddEn,
                onTapEnvelope: () {
                  setState(() {
                    _isSelectedEnvelope = true;
                    _isSelectedEn = false;
                    _isSelectedEnn = false;
                    _isSelecteddEn = false;
                  });
                },
                onTapEn: () {
                  setState(() {
                    _isSelectedEnvelope = false;
                    _isSelectedEn = true;
                    _isSelectedEnn = false;
                    _isSelecteddEn = false;
                  });
                },
                onTapEnn: () {
                  setState(() {
                    _isSelectedEnvelope = false;
                    _isSelectedEn = false;
                    _isSelectedEnn = true;
                    _isSelecteddEn = false;
                  });
                },
                onTappEn: () {
                  setState(() {
                    _isSelectedEnvelope = false;
                    _isSelectedEn = false;
                    _isSelectedEnn = false;
                    _isSelecteddEn = true;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.remove_circle,
                      size: 50,
                      color: Colors.red,
                    ),
                    onTap: () {
                      if (LookUp.parcels.isNotEmpty) {
                        LookUp.parcels.removeLast();
                        setState(() {
                          _parcelNumber -= 1;
                        });
                      }
                    },
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.add_circle,
                      size: 50,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      if (_heightTextController.text.isNotEmpty &&
                          _lenghtTextController.text.isNotEmpty &&
                          _massTextController.text.isNotEmpty &&
                          _widthTextController.text.isNotEmpty) {
                        if (LookUp.parcels.length < 5) {
                          LookUp.parcels.add(
                            Parcel(
                              height: double.parse(_heightTextController.text),
                              length: double.parse(_lenghtTextController.text),
                              mass: double.parse(_massTextController.text),
                              width: double.parse(_widthTextController.text),
                            ),
                          );
                          setState(() {
                            _heightTextController.text = "";
                            _lenghtTextController.text = "";
                            _massTextController.text = "";
                            _widthTextController.text = "";
                            _parcelNumber += 1;
                            print(
                                " ================= : ${LookUp.parcels.length}");
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(Strings.finalBilling),
                  ),
                  Checkbox(
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                ],
              ),
              RsButton(
                title: 'Done',
                radisNumber: 6,
                onTaped: () {
                  _handleParcels();
                },
              ),
              // SizedBox(
              //   height: 50,
              // )
            ],
          ),
        ),
      ),
    );
  }

  _handleParcels() async {
    if (_heightTextController.text.isNotEmpty &&
        _lenghtTextController.text.isNotEmpty &&
        _massTextController.text.isNotEmpty &&
        _widthTextController.text.isNotEmpty) {
      if (LookUp.parcels.length < 5) {
        LookUp.parcels.add(
          Parcel(
            height: double.parse(_heightTextController.text),
            length: double.parse(_lenghtTextController.text),
            mass: double.parse(_massTextController.text),
            width: double.parse(_widthTextController.text),
          ),
        );
      }
      List<Map<String, dynamic>> parcelsList = [];
      for (var parcel in LookUp.parcels) {
        parcelsList.add(parcel.toMap());
      }
      Map<String, dynamic> parcels = {"parcels": parcelsList};
      await _userService.addParcels(parcels);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CourierSecreen(),
        ),
      );
    }
  }
}
