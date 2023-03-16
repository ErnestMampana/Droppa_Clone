// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:droppa_clone/LookUp/lookup.dart';
import 'package:droppa_clone/backend/providers/app_data.dart';
import 'package:droppa_clone/backend/services/WebApiDataService%20.dart';
import 'package:droppa_clone/backend/services/firebase_service.dart';
import 'package:droppa_clone/backend/services/user_service.dart';
import 'package:droppa_clone/screens/signup_screen.dart';
import 'package:droppa_clone/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_activty_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //variables
  final UserService _userService = UserService();

  //TextField Validation
  bool _emailValid = false;
  bool _passwordValid = false;

  //controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();

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
                TextFormField(
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Can\'t be empty';
                  //   }
                  //   if (value.length < 4) {
                  //     return 'Too short';
                  //   }
                  //   return null;
                  // },
                  // onChanged: (value) =>
                  //     setState(() => _emailController.text = value),
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorText: _emailValid ? 'Required field' : null,
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onTap: (() {
                    setState(() {
                      _emailValid = false;
                    });
                  }),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextField(
                  controller: _passordController,
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
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) =>
                //             ForgotPasswordScreen()));
              },
              child: const Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () async {
                setState(() {
                  if (_emailController.text.isEmpty &&
                      _passordController.text.isEmpty) {
                    _emailValid = true;
                    _passwordValid = true;
                    //_valid = false;
                  } else if (_passordController.text.isEmpty) {
                    _passwordValid = true;
                  } else if (_passordController.text.isEmpty == true) {
                    _passwordValid = true;
                  } else {
                    _handleLogin();
                  }
                });
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
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                'if you do not have an account\n                 click below.'),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text(
                'SIGN UP',
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

  _handleLogin() async {
    DialogUtils.showLoading(context);
    Map<String, dynamic> userdetails = {
      'username': _emailController.text,
      'password': _passordController.text,
      //'returnSecureToken': true
    };
    var response = await _userService.login(userdetails);
    
    if (response.token != null) {
      context.read<AppData>().changePrice(response.walletBalance!);
      await _userService.getAllBookings(response.userId);
      DialogUtils.hideDialog(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MainActivityScreen(),
        ),
      );
    } else {
      // Map<String, dynamic> map = json.decode(response.body);
      // print("================ : " + map['message']);
    }
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> map = json.decode(response.body);
    //   String email = map['email'];
    //   var resp = await _webApiDataService.getBookingsForUser(email);
    //   Map<String, dynamic> mapBookings = json.decode(response.body);
    //   mapBookings.forEach((key, value) {
    //     //LookUp.bookings.add(key);
    //   });
    //   print(resp.body.toString());
    // }

    // //if(response.body.toString())
    // print(response.body.toString());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passordController.dispose();
    super.dispose();
  }
}
