import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/screens/otp_screen.dart';
import 'package:droppa_clone/screens/payment_screen.dart';
import 'package:droppa_clone/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppData()),
    ],
    child: const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Droppa Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const MainActivityScreen(),// PaymentScreen(price: 1250), 
          // routes: {
          //   '/wallet_screen': (context) => const WalletScreen(),
          // },
    );
  }
}



// import 'package:droppa_clone/backend/keys.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'dart:async';
// import 'dart:math';

// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_webservice/places.dart';

// final customTheme = ThemeData(
//   primarySwatch: Colors.blue,
//   brightness: Brightness.dark,
//   accentColor: Colors.redAccent,
//   inputDecorationTheme: InputDecorationTheme(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(4.00)),
//     ),
//     contentPadding: EdgeInsets.symmetric(
//       vertical: 12.50,
//       horizontal: 10.00,
//     ),
//   ),
// );

// class RoutesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         title: "My App",
//         //theme: customTheme,
//         routes: {
//           "/": (_) => MyApp(),
//           "/search": (_) => CustomSearchScaffold(),
//         },
//       );
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// final homeScaffoldKey = GlobalKey<ScaffoldState>();
// final searchScaffoldKey = GlobalKey<ScaffoldState>();

// class _MyAppState extends State<MyApp> {
//   Mode _mode = Mode.overlay;
//   static const kGoogleApiKey = "AIzaSyDW5ueY7LF-y4-gsJ3dHUOaOvRKKrRz8sE";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: homeScaffoldKey,
//       appBar: AppBar(
//         title: Text("My App"),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _buildDropdownMenu(),
//           ElevatedButton(
//             onPressed: _handlePressButton,
//             child: Text("Search places"),
//           ),
//           ElevatedButton(
//             child: Text("Custom"),
//             onPressed: () {
//               Navigator.of(context).pushNamed("/search");
//             },
//           ),
//         ],
//       )),
//     );
//   }

//   Widget _buildDropdownMenu() => DropdownButton(
//         value: _mode,
//         items: <DropdownMenuItem<Mode>>[
//           DropdownMenuItem<Mode>(
//             child: Text("Overlay"),
//             value: Mode.overlay,
//           ),
//           DropdownMenuItem<Mode>(
//             child: Text("Fullscreen"),
//             value: Mode.fullscreen,
//           ),
//         ],
//         onChanged: (m) {
//           setState(() {
//             //_mode = m;
//           });
//         },
//       );

//   void onError(PlacesAutocompleteResponse response) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(response.errorMessage!)),
//     );
//   }

//   Future<void> _handlePressButton() async {
//     // show input autocomplete with selected mode
//     // then get the Prediction selected
//     Prediction? p = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: kGoogleApiKey,
//       onError: onError,
//       mode: _mode,
//       language: "fr",
//       decoration: InputDecoration(
//         hintText: 'Search',
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       components: [Component(Component.country, "fr")],
//     );

//     displayPrediction(p!, homeScaffoldKey.currentState!);
//   }
// }

// Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
//   if (p != null) {
//     // get detail (lat/lng)
//     GoogleMapsPlaces _places = GoogleMapsPlaces(
//       apiKey: Keys.googleMapsIosKey,
//       apiHeaders: await GoogleApiHeaders().getHeaders(),
//     );
//     PlacesDetailsResponse detail =
//         await _places.getDetailsByPlaceId(p.placeId!);
//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;

// // ScaffoldMessenger.of(context).showSnackBar(
    
// //       SnackBar(content: Text("${p.description} - $lat/$lng")),
// //     );
//   }
// }

// // custom scaffold that handle search
// // basically your widget need to extends [GooglePlacesAutocompleteWidget]
// // and your state [GooglePlacesAutocompleteState]
// class CustomSearchScaffold extends PlacesAutocompleteWidget {
//   CustomSearchScaffold()
//       : super(
//           apiKey: Keys.googleMapsIosKey,
//           sessionToken: Uuid().generateV4(),
//           language: "en",
//           components: [Component(Component.country, "uk")],
//         );

//   @override
//   _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
// }

// class _CustomSearchScaffoldState extends PlacesAutocompleteState {
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
//     final body = PlacesAutocompleteResult(
//       onTap: (p) {
//         displayPrediction(p, searchScaffoldKey.currentState!);
//       },
//       logo: Row(
//         children: [FlutterLogo()],
//         mainAxisAlignment: MainAxisAlignment.center,
//       ),
//     );
//     return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
//   }

//   @override
//   void onResponseError(PlacesAutocompleteResponse response) {
//     super.onResponseError(response);
//     ScaffoldMessenger.of(context).showSnackBar(
   
//       SnackBar(content: Text(response.errorMessage!)),
//     );
//   }

//   // @override
//   // void onResponse(PlacesAutocompleteResponse response) {
//   //   super.onResponse(response);
//   //   if (response != null && response.predictions.isNotEmpty) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text("Got answer")),
//   //     );
//   //   }
//   // }
// }

// class Uuid {
//   final Random _random = Random();

//   String generateV4() {
//     // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
//     final int special = 8 + _random.nextInt(4);

//     return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
//         '${_bitsDigits(16, 4)}-'
//         '4${_bitsDigits(12, 3)}-'
//         '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
//         '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
//   }

//   String _bitsDigits(int bitCount, int digitCount) =>
//       _printDigits(_generateBits(bitCount), digitCount);

//   int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

//   String _printDigits(int value, int count) =>
//       value.toRadixString(16).padLeft(count, '0');
// }
