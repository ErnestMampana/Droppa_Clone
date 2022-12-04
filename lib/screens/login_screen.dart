import 'package:droppa_clone/backend/services/firebase_service.dart';
import 'package:droppa_clone/screens/signup_screen.dart';
import 'package:droppa_clone/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //variables
  final Authantication _authantication = Authantication();

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
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
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
                await _handleLogin();
                setState(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.blue.shade600, size: 75),
                        );
                      });
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
    LoadingAnimationWidget.discreteCircle(
        color: Colors.blue.shade600, size: 20);
    Map<String, dynamic> userdetails = {
      'email': _emailController.text,
      'password': _passordController.text,
      'returnSecureToken': true
    };
    var response = await _authantication.login(userdetails);
    print(response.statusCode.toString());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passordController.dispose();
    super.dispose();
  }
}
