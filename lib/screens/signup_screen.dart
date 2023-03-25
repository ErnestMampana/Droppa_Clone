// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:droppa_clone/backend/classes/person.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:droppa_clone/backend/services/firebase_service.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/main_activty_screen.dart';
import 'package:droppa_clone/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/dialog.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Authantication _authentication = Authantication();
  final UserService _userService = UserService();

  //Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cellphoneNumberController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userSurnameController = TextEditingController();

  //TextFiend validation
  bool _emailValid = false;
  bool _nameValid = false;
  bool _surnameValid = false;
  bool _cellphoneValid = false;
  bool _passwordValid = false;
  bool _confirmPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Sign in'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(children: [
            Column(
              children: const [
                Image(
                  width: 400,
                  image: ExactAssetImage('assets/barr.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Sign in to Droppa',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    errorText: _nameValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  onTap: () {
                    setState(() {
                      _nameValid = false;
                    });
                  },
                  controller: _userNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    errorText: _surnameValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Surname',
                  ),
                  onTap: () {
                    setState(() {
                      _surnameValid = false;
                    });
                  },
                  controller: _userSurnameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    errorText: _cellphoneValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                  onTap: () {
                    setState(() {
                      _cellphoneValid = false;
                    });
                  },
                  controller: _cellphoneNumberController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    errorText: _emailValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  controller: _emailController,
                  onTap: () {
                    setState(() {
                      _emailValid = false;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: _passwordValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onTap: () {
                    setState(() {
                      _passwordValid = false;
                    });
                  },
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    errorText: _confirmPasswordValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                  onTap: () {
                    setState(() {
                      _confirmPasswordValid = false;
                    });
                  },
                  controller: _confirmPasswordController,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                _handleSignUp();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => const LoginScreen(),
                //   ),
                // );
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 0,
              minWidth: double.maxFinite,
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _handleSignUp() async {
    bool strongPassword = false;

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    strongPassword = regExp.hasMatch(_passwordController.text);
    if (strongPassword) {
      if (_passwordController.text == _confirmPasswordController.text) {
        DialogUtils.showLoading(context);
        Map<String, dynamic> userPersonalDetails = {
          'userName': _userNameController.text,
          'surname': _userSurnameController.text,
          'cellphone': _cellphoneNumberController.text,
          'email': _emailController.text,
          'password': _passwordController.text
        };
        var response = await _userService.createAccount(userPersonalDetails);
        //Map<String, dynamic> map = json.decode(response.body);
        DialogUtils.hideDialog(context);
        if (response.userId != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const OtpScreen(),
            ),
          );
        } else {
          //print("=========================== : " + map["message"]);
        }
      }
    }

    // For firebase connection
    // Map<String, dynamic> userDetails = {
    //   'email': 'ernest.mampana@gmail.com',
    //   'password': 'thatomohlala',
    //   'returnSecureToken': true
    // };
    // await _authentication.signUp(userDetails);
  }

  // _handleSignUp() async {
  //   DialogUtils.showLoading(context);
  //   Map<String, dynamic> userPersonalDetails = {
  //     'userName': "Ernest",
  //     'surname': "Mampana",
  //     'cellphone': "0723568069",
  //     'email': "ernest@gmail.com",
  //     'password': "Th@7!to06"
  //   };

  //   var response = await _userService.createAccount(userPersonalDetails);

  //   DialogUtils.hideDialog(context);

  //   if (response == "") {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => const OtpScreen(),
  //       ),
  //     );
  //   }
  // }
}
