import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/screens/otp_screen.dart';
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
          const MainActivityScreen(), 
          // routes: {
          //   '/wallet_screen': (context) => const WalletScreen(),
          // },
    );
  }
}
