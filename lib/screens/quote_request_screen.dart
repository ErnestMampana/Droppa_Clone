// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously


import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/keys.dart';
import 'package:droppa_clone/backend/models/pick_result.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/parcel_screen.dart';
import 'package:droppa_clone/screens/vehlicle_quote_screen.dart';
import 'package:droppa_clone/widgets/buttom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_distance_matrix/google_distance_matrix.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class QuoteRequestScreen extends StatefulWidget {
  final String title;
  final String description;

  const QuoteRequestScreen(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  static const kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  State<QuoteRequestScreen> createState() => _QuoteRequestScreenState();
}

class _QuoteRequestScreenState extends State<QuoteRequestScreen> {
  final UserService _userService = UserService();

  //google variables
  final GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: Keys.googleMapsAndroidKey);
  GoogleDistanceMatrix googleDistanceMatrix = GoogleDistanceMatrix();
  double? _distanceInKm;
  double? _pickUpLat;
  double? _pickUpLong;
  double? _dropOffLat;
  double? _dropOffLong;

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

  final TextEditingController _pickUpAdress = TextEditingController();
  final TextEditingController _dropOffAdress = TextEditingController();

  String? _title;
  String? _description;

  late PickResult selectedPlace;

  final bool _dismiss = false;
  bool _companyNameValid = false;
  bool _postalCodeValid = false;
  bool _provinceValid = false;
  bool _streetAddressValid = false;
  bool _suburbValid = false;

  

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
                                  onTap: () async {
                                    var place = await PlacesAutocomplete.show(
                                        offset: 0,
                                        radius: 1000,
                                        context: context,
                                        apiKey: Keys.googleMapsAndroidKey,
                                        mode: Mode.overlay,
                                        types: [],
                                        strictbounds: false,
                                        components: [
                                          Component(Component.country, 'za')
                                        ],
                                        //startText: "droppa",
                                        //google_map_webservice package
                                        onError: (err) {});
                                    if (place != null) {
                                      displayPrediction(place, 1);
                                    }
                                  },
                                  child: TextField(
                                    controller: _pickUpAdress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.search),
                                      enabled: false,
                                      contentPadding: EdgeInsets.only(
                                          left: 6, top: 8, right: 0, bottom: 0),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        _title == "Courier"
                            ? InkWell(
                                onTap: () async {
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
                                          onTapCompanyName: () {
                                            setState(() {
                                              _companyNameValid = false;
                                            });
                                          },
                                          onTapPostalCode: () {
                                            setState(() {
                                              _postalCodeValid = false;
                                            });
                                          },
                                          onTapProvince: () {
                                            setState(() {
                                              _provinceValid = false;
                                            });
                                          },
                                          onTapStreetAddress: () {
                                            setState(() {
                                              _streetAddressValid = false;
                                            });
                                          },
                                          onTapSuburb: () {
                                            setState(() {
                                              _suburbValid = false;
                                            });
                                          },
                                          companyNameValid: _companyNameValid,
                                          postalCodeValid: _postalCodeValid,
                                          provinceValid: _provinceValid,
                                          streetAddressValid:
                                              _streetAddressValid,
                                          suburbValid: _suburbValid,
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
                            : const SizedBox(),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                              child: GestureDetector(
                                onTap: () async {
                                  var place = await PlacesAutocomplete.show(
                                      offset: 0,
                                      radius: 1000,
                                      context: context,
                                      apiKey: Keys.googleMapsAndroidKey,
                                      mode: Mode.overlay,
                                      types: [],
                                      strictbounds: false,
                                      components: [
                                        Component(Component.country, 'za')
                                      ],
                                      //startText: "droppa",
                                      //google_map_webservice package
                                      onError: (err) {});
                                  if (place != null) {
                                    displayPrediction(place, 2);
                                  }
                                },
                                child: TextField(
                                  controller: _dropOffAdress,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.search),
                                    enabled: false,
                                    contentPadding: EdgeInsets.only(
                                        left: 6, top: 8, right: 0, bottom: 0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _title == "Courier"
                            ? InkWell(
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
                                          onTapCompanyName: () {
                                            setState(() {
                                              _companyNameValid = false;
                                            });
                                          },
                                          onTapPostalCode: () {
                                            setState(() {
                                              _postalCodeValid = false;
                                            });
                                          },
                                          onTapProvince: () {
                                            setState(() {
                                              _provinceValid = false;
                                            });
                                          },
                                          onTapStreetAddress: () {
                                            setState(() {
                                              _streetAddressValid = false;
                                            });
                                          },
                                          onTapSuburb: () {
                                            setState(() {
                                              _suburbValid = false;
                                            });
                                          },
                                          companyNameValid: _companyNameValid,
                                          postalCodeValid: _postalCodeValid,
                                          provinceValid: _provinceValid,
                                          streetAddressValid:
                                              _streetAddressValid,
                                          suburbValid: _suburbValid,
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
                                            setState(
                                              () {
                                                _dropOffAdress.text =
                                                    "Unit ${_dropUnitNumberController.text} Building ${_dropBuildingNumberController.text} ${_dropSuburbTextController.text} ${_dropStreetTextController.text} ${_dropProvinceTextController.text}";
                                                _dropOffAddressController.text =
                                                    _dropOffAdress.text;
                                              },
                                            );

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
                            : const SizedBox(),
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
                        if (_pickUpAdress.text.isNotEmpty ||
                            _dropOffAdress.text.isNotEmpty) {
                          _handlePriceRequest();
                        }
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

  Future<void> displayPrediction(var p, int textNumber) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId!);

      setState(() {
        if (textNumber == 1) {
          _pickUpAdress.text = detail.result.formattedAddress!;
          _pickUpLat = detail.result.geometry!.location.lat;
          _pickUpLong = detail.result.geometry!.location.lng;
        } else {
          _dropOffAdress.text = detail.result.formattedAddress!;
          _dropOffLat = detail.result.geometry!.location.lat;
          _dropOffLong = detail.result.geometry!.location.lng;
        }
      });
    }
  }

  Future<double> calculateDistance(double pickUpLat, double pickUpLong,
      double dropOffLat, double dropOffLong) async {
    var distanceMatrix = await googleDistanceMatrix.getDistance(
      Keys.key,
      origin: Coordinate(
          latitude: pickUpLat.toString(), longitude: pickUpLong.toString()),
      destination: Coordinate(
          latitude: dropOffLat.toString(), longitude: dropOffLong.toString()),
    );

    setState(() {
      _distanceInKm = distanceMatrix as double?;
    });

    // var p = 0.017453292519943295;
    // var a = 0.5 -
    //     cos((dropOffLat - pickUpLat) * p) / 2 +
    //     cos(pickUpLat * p) *
    //         cos(dropOffLat * p) *
    //         (1 - cos((dropOffLong - pickUpLong) * p)) /
    //         2;
    // return 12742 * asin(sqrt(a));

    return _distanceInKm!;
  }

  void _handlePriceRequest() async {
    if (_title == 'Fleet') {
      var distance = calculateDistance(
          _pickUpLat!, _pickUpLong!, _dropOffLat!, _dropOffLong!);

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
    } else {
      Map<String, dynamic> addressDetails = {
        "pickupCoordinates": _pickUpAdress.text,
        "dropOffCoordinates": _dropOffAdress.text
      };
      LookUp.courierDropOffAddress = _dropOffAdress.text;
      LookUp.courierPickUpAddress = _pickUpAdress.text;
      double price = await _userService.requestPrice(addressDetails);
      LookUp.courierPrice = price;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ParcelScreen(),
        ),
      );
    }
  }
}
