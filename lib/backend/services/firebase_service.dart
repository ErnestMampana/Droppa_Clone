import 'dart:convert';

import 'package:droppa_clone/backend/keys.dart';
import 'package:http/http.dart' as http;

class Authantication {
  //variables
  String key = Keys.key;

  //Register account
  Future<void> signUp(Map<String, dynamic> userDetails) async {
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$key';
    var requestBody = jsonEncode(userDetails);
    var response = await http.post(Uri.parse(url), body: requestBody);
    print(jsonDecode(response.body));
  }
}
