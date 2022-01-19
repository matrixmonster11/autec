import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:autec/models/login_request_model.dart';
import 'package:autec/models/login_response_model.dart';
import 'package:autec/services/shared_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  final String apiUrl = "http://localhost:3000/cases";

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(dotenv.env['LOGIN_API']!);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}'
    };

    var url = Uri.https(dotenv.env['API_URL']!, dotenv.env['USER_PROFILE_API']!);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
