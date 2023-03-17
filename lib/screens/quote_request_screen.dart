// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/parcel_screen.dart';
import 'package:droppa_clone/screens/rental_service_screen.dart';
import 'package:droppa_clone/screens/vehlicle_quote_screen.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:droppa_clone/widgets/buttom_sheet.dart';
import 'package:droppa_clone/widgets/button.dart';
import 'package:flutter/material.dart';

class QuoteRequestScreen extends StatefulWidget {
  final String title;
  final String description;

  const QuoteRequestScreen(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  State<QuoteRequestScreen> createState() => _QuoteRequestScreenState();
}

class _QuoteRequestScreenState extends State<QuoteRequestScreen> {
  final UserService _userService = UserService();

  //Text Controllers
  final _dropOffAddressController = TextEditingController();
  final TextEditingController _pickBuildingNumberController =
      TextEditingController();
  final TextEditingController _pickCompanyNameTextController =
      TextEditingController();
  final TextEditingController _pickPostalTextController =
      TextEditingController();
  final TextEditingController _pickProvinceTextController =
      TextEditingController();
  final TextEditingController _pickStreetTextController =
      TextEditingController();
  final TextEditingController _pickSuburbTextController =
      TextEditingController();
  final TextEditingController _pickUnitNumberController =
      TextEditingController();

  final TextEditingController _dropBuildingNumberController =
      TextEditingController();
  final TextEditingController _dropCompanyNameTextController =
      TextEditingController();
  final TextEditingController _dropPostalTextController =
      TextEditingController();
  final TextEditingController _dropProvinceTextController =
      TextEditingController();
  final TextEditingController _dropStreetTextController =
      TextEditingController();
  final TextEditingController _dropSuburbTextController =
      TextEditingController();
  final TextEditingController _dropUnitNumberController =
      TextEditingController();

  TextEditingController _pickUpAdress = TextEditingController();
  TextEditingController _dropOffAdress = TextEditingController();

  String? _title;
  String? _description;

  bool _dismiss = false;

  @override
  void initState() {
    _title = widget.title;
    _description = widget.description;
    super.initState();
  }

  @override
  void dispose() {
    _dropBuildingNumberController.dispose();
    _dropCompanyNameTextController.dispose();
    _dropPostalTextController.dispose();
    _dropProvinceTextController.dispose();
    _dropStreetTextController.dispose();
    _dropUnitNumberController.dispose();
    _dropSuburbTextController.dispose();
    _pickBuildingNumberController.dispose();
    _pickCompanyNameTextController.dispose();
    _pickPostalTextController.dispose();
    _pickProvinceTextController.dispose();
    _pickStreetTextController.dispose();
    _pickSuburbTextController.dispose();
    _pickUnitNumberController.dispose();
    _pickUpAdress.dispose();
    _dropOffAdress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        actions: const [
          Icon(Icons.chat),
        ],
        title: Text('$_title'),
        centerTitle: true,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(Icons.arrow_back),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Column(
                children: const [
                  Image(
                    width: 400,
                    image: ExactAssetImage('assets/barr.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.my_location_outlined,
                                color: Colors.blue,
                                size: 30,
                              ),
                              Container(
                                width: 225,
                                height: 30,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: TextField(
                                    //maxLines: 500,
                                    controller: _pickUpAdress,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isDismissible: _dismiss,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (BuildContext context) {
                                  return ButtomSheetWidget(
                                    buildingNumberController:
                                        _pickBuildingNumberController,
                                    conpanyNameTextController:
                                        _pickCompanyNameTextController,
                                    postalTextController:
                                        _pickPostalTextController,
                                    provinceTextController:
                                        _pickProvinceTextController,
                                    streetTextController:
                                        _pickStreetTextController,
                                    suburbTextController:
                                        _pickSuburbTextController,
                                    unitNumberController:
                                        _pickUnitNumberController,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      });
                                    },
                                    onPress: () {
                                      _pickUpAdress.text =
                                          "Unit ${_pickUnitNumberController.text} Building ${_pickBuildingNumberController.text} ${_pickSuburbTextController.text} ${_pickStreetTextController.text} ${_pickProvinceTextController.text}";
                                      print(_pickUpAdress.text);
                                      Navigator.pop(context);
                                    },
                                    onCancel: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                });
                          },
                          child: const Text(
                            "Can't find address? Click here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 40, 63, 73),
                      ),
                      //color: Colors.black54,
                      child: const Center(
                        child: Text(
                          'Pick-up address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // margin: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 219, 8, 8),
                      ),
                      const Text(' - - - - - - '),
                      Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 219, 8, 8),
                        ),
                        //color: Colors.black54,
                        child: const Center(
                          child: Text(
                            'Selected Service',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Text(' - - - - - - '),
                      const Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 219, 8, 8),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 100,
                        ),
                        child: Image.asset('assets/dropskyflight.png',
                            fit: BoxFit.scaleDown),
                      ),
                      title: Text(
                        '$_title',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text('$_description'),
                      trailing: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.my_location_outlined,
                                color: Color.fromARGB(255, 226, 13, 13),
                                size: 30,
                              ),
                              Container(
                                width: 225,
                                height: 30,
                                child: TextField(
                                  enabled: false,
                                  controller: _dropOffAddressController,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isDismissible: _dismiss,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                builder: (BuildContext context) {
                                  return ButtomSheetWidget(
                                    buildingNumberController:
                                        _dropBuildingNumberController,
                                    conpanyNameTextController:
                                        _dropCompanyNameTextController,
                                    postalTextController:
                                        _dropPostalTextController,
                                    provinceTextController:
                                        _dropProvinceTextController,
                                    streetTextController:
                                        _dropStreetTextController,
                                    suburbTextController:
                                        _dropSuburbTextController,
                                    unitNumberController:
                                        _dropUnitNumberController,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      });
                                    },
                                    onPress: () {
                                      setState(() {
                                        _dropOffAdress.text =
                                            "Unit ${_dropUnitNumberController.text} Building ${_dropBuildingNumberController.text} ${_dropSuburbTextController.text} ${_dropStreetTextController.text} ${_dropProvinceTextController.text}";
                                        _dropOffAddressController.text =
                                            _dropOffAdress.text;
                                      });
                                      print(_dropOffAdress.text);
                                      Navigator.pop(context);
                                    },
                                    onCancel: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                });
                          },
                          child: const Text(
                            "Can't find address? Click here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 40, 63, 73),
                      ),
                      //color: Colors.black54,
                      child: const Center(
                        child: Text(
                          'Drop-off address',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: _title == 'Courier'
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ParcelScreen(),
                          ),
                        );
                      }
                    : () {
                        if (_pickUpAdress.text != "" ||
                            _dropOffAdress.text != "") {
                          _handlePriceRequest();
                        }
                      },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 0,
                minWidth: double.minPositive,
                child: const Text(
                  'Get quote',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePriceRequest() async {
    Map<String, dynamic> addressDetails = {
      "pickupCoordinates": _pickUpAdress.text,
      "dropOffCoordinates": _dropOffAdress.text
    };
    double requestedAmount = await _userService.requestPrice(addressDetails);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VehicleQuoteScreen(
          price: requestedAmount,
          dropOffAdress: _dropOffAdress.text,
          pickUpAdress: _pickUpAdress.text,
        ),
      ),
    );
  }
}
