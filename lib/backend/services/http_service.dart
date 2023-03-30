import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';


class HttpService {
  // Future<BaseApiResponse> postAuthenticated(String url, dynamic body) async {
  //   var headers = await _getHeaders(true);
  //   var urlParse = Uri.parse(url);
  //   final response = await http.post(urlParse, headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     return ApiResponse.fromJson(json.decode(response.body));
  //   } else {
  //     return ApiErrorResponse.fromJson(json.decode(response.body));
  //   }
  // }

  Future<Response> post(String url, dynamic body) async {
    var headers = await _getHeaders(false);
    var urlParse = Uri.parse(url);
    final response = await http.post(urlParse, headers: headers, body: body);

    return response;
  }

  // Future<BaseApiResponse> post(String url, dynamic body) async {
  //   var headers = await _getHeaders(false);
  //   var urlParse = Uri.parse(url);
  //   final response = await http.post(urlParse, headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     return ApiResponse.fromJson(json.decode(response.body));
  //   } else {
  //     //toastMessage(response.body[3]);
  //     //toastMessage(json.decode(response.body));
  //     return ApiErrorResponse.fromJson(json.decode(response.body));
  //   }
  // }

  Future<Response> put(String url, dynamic body) async {
    var headers = await _getHeaders(false);
    var urlParse = Uri.parse(url);
    final response = await http.put(urlParse, headers: headers, body: body);
    return response;
  }

  Future<Response> get(String url) async {
    var headers = await _getHeaders(false);
    var urlParse = Uri.parse(url);
    final response = await http.get(urlParse, headers: headers);
    return response;
    // if (response.statusCode == 200) {
    //   return ApiResponse.fromJson(json.decode(response.body));
    // } else {
    //   return ApiErrorResponse.fromJson(json.decode(response.body));
    // }
  }

  // Future<BaseApiResponse> getAuthenticated(String url) async {
  //   var headers = await _getHeaders(true);
  //   var urlParse = Uri.parse(url);
  //   final response = await http.get(urlParse, headers: headers);
  //   if (response.statusCode == 200) {
  //     return ApiResponse.fromJson(json.decode(response.body));
  //   } else {
  //     return ApiErrorResponse.fromJson(json.decode(response.body));
  //   }
  // }

  Future<Map<String, String>> _getHeaders(bool authenticated) async {
    if (authenticated) {
      var person = FirebaseAuth.instance.currentUser!;
      var authToken = await person.getIdToken();
      return <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        //"Authorization": "${authToken}"
        "Authorization": "Bearer $authToken"
      };
    }
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }
  //; charset=UTF-8
}
