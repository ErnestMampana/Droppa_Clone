import 'package:droppa_clone/LookUp/strings.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:droppa_clone/widgets/parcel.dart';
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

  //Text Controllers
  final TextEditingController _massTextController = TextEditingController();
  final TextEditingController _lenghtTextController = TextEditingController();
  final TextEditingController _widthTextController = TextEditingController();
  final TextEditingController _heightTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Parcel'),
        centerTitle: false,
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
              // ParcelContainerWideget(
              //   massTextController: _massTextController,
              //   lenghtTextController: _lenghtTextController,
              //   widthTextController: _widthTextController,
              //   heightTextController: _heightTextController,
              // ),
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
              RsButton(title: 'Done', radisNumber: 6, onTaped: () {}),
              // SizedBox(
              //   height: 50,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
