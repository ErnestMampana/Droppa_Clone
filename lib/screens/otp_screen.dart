// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/widgets/Rental_textField.dart';
import 'package:flutter/material.dart';

import '../widgets/dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  //Web service
  final UserService _userService = UserService();

  //TextController
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm OTP'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              const Image(
                width: 400,
                image: ExactAssetImage('assets/barr.png'),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                  'Please confirm your account. Use the OTP code we sent to you via sms',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              RentalTextField(
                  label: 'Confirmation code(OTP)',
                  textController: _otpController),
              const SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {
                  _handleConfirmation();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const LoginScreen(),
                  //   ),
                  // );
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                minWidth: double.maxFinite,
                child: const Text(
                  'Confirm OTP',
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

  void _handleConfirmation() async {
    DialogUtils.showLoading(context);
    String email = userPersonalDetailsDTO!.userId!;
    int code = int.parse(_otpController.text);

    var userPersonalDetails = await _userService.confirmOtp(email, code);
    DialogUtils.hideDialog(context);
    if (userPersonalDetails.token != null) {
      await _userService.getAllBookings(userPersonalDetails.userId);
      print("================ : Account Activated");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>  const MainActivityScreen(),
        ),
      );
    } else {
      // Map<String, dynamic> map = json.decode(response.body);
      // print("================ : " + map['message']);
    }
  }
}
