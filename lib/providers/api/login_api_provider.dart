import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login_bloc/core/urls.dart';

class LoginApiProvider {
  Future<String> loginButtonPressed(String email, String password) async {
    /* final http.Response response = await http.post(
      Uri.parse(Urls.loginUrl),
      body: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> token = json.decode(response.body) as Map;
      return token["token"];
    } 
    return null;*/
    return "r33412jourfıa";
  }
}
