import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:autec/services/shared_service.dart';
import 'package:autec/models/login_response_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ApiResponse {
  final bool isSuccess;
  final String errorMessage;
  final dynamic data;

    ApiResponse({
    required this.isSuccess,
    required this.errorMessage,
    required this.data,
  });
}

class Api {
  static const String apiEndpoint = "http://ec2-3-15-13-227.us-east-2.compute.amazonaws.com/";
  Future<ApiResponse> getRequest({
    required String url,
    Map<String, String> headers = const {},
  }) async {
    var loginDetails = await SharedService.loginDetails();
    final _client = new Client();
    headers={HttpHeaders.authorizationHeader: 'Bearer ${loginDetails!.token}'};
    Response response = await _client
        .get(Uri.parse(url), headers: headers)
        .timeout(Duration(seconds: 30))
        .whenComplete(_client.close);

    String res = response.body;

    if (response.statusCode < 200 || response.statusCode > 400) {
      return ApiResponse(
        isSuccess: false,
        errorMessage: response.body,
        data: {},
      );
    }

    final JsonDecoder _decoder = new JsonDecoder();

    return ApiResponse(
      isSuccess: true,
      errorMessage: "",
      data: _decoder.convert(res),
    );
  }

  Future<ApiResponse> postRequest({
    required String url,
    Map<String, String> headers = const {},
    required Map<String, String> json,

  }) async {
    final _client = new Client();
    var loginDetails = await SharedService.loginDetails();
    headers={HttpHeaders.authorizationHeader: 'Bearer ${loginDetails!.token}'};
    print("json abid => $json");
    Response response = await _client
        .post(Uri.parse(url), headers: headers, body: json)
        .timeout(Duration(seconds: 30))
        .whenComplete(_client.close);

    String res = response.body;

    if (response.statusCode < 200 || response.statusCode > 400) {
      return ApiResponse(
        isSuccess: false,
        errorMessage: response.body,
        data: {},
      );
    }

    final JsonDecoder _decoder = new JsonDecoder();

    return ApiResponse(
      isSuccess: true,
      errorMessage: "",
      data: _decoder.convert(res),
    );
  }

  Future<ApiResponse> putRequest({
    required String url,
    Map<String, String> headers = const {},
    required Map<String, String> json,
  }) async {
    var loginDetails = await SharedService.loginDetails();
    headers={HttpHeaders.authorizationHeader: 'Bearer ${loginDetails!.token}'};
    final _client = new Client();
    Response response = await _client
        .put(Uri.parse(url), headers: headers, body: json)
        .timeout(Duration(seconds: 30))
        .whenComplete(_client.close);

    String res = response.body;

    if (response.statusCode < 200 || response.statusCode > 400) {
      return ApiResponse(
        isSuccess: false,
        errorMessage: response.body,
        data: {},
      );
    }

    final JsonDecoder _decoder = new JsonDecoder();

    return ApiResponse(
      isSuccess: true,
      errorMessage: "",
      data: _decoder.convert(res),
    );
  }

  Future<ApiResponse> deleteRequest({
    required String url,
    Map<String, String> headers = const {}, required Map<String, String> json,
  }) async {
    var loginDetails = await SharedService.loginDetails();
    headers={HttpHeaders.authorizationHeader: 'Bearer ${loginDetails!.token}'};
    print("json abid => $json");
    final _client = new Client();
    Response response = await _client
        .delete(Uri.parse(url), headers: headers, body: json)
        .timeout(Duration(seconds: 30))
        .whenComplete(_client.close);

    String res = response.body;

    if (response.statusCode < 200 || response.statusCode > 400) {
      return ApiResponse(
        isSuccess: false,
        errorMessage: response.body,
        data: {},
      );
    }

    final JsonDecoder _decoder = new JsonDecoder();

    return ApiResponse(
      isSuccess: true,
      errorMessage: "",
      data: _decoder.convert(res),
    );
  }

  Future<ApiResponse> uploadFile({
    required String url,
    required String filename,
    required ByteData bytesData,
  }) async {
    final multipartRequest = MultipartRequest('POST', Uri.parse(url));

    final file = MultipartFile.fromBytes(
      filename,
      bytesData.buffer.asUint8List(),
      filename: filename,
    );

    multipartRequest.files.add(file);

    final response = await multipartRequest.send();

    if (response.statusCode ~/ 100 != 2) {
      return ApiResponse(
        isSuccess: false,
        errorMessage: response.reasonPhrase!,
        data: {},
      );
    } else {
      return ApiResponse(
        isSuccess: false,
        errorMessage: "",
        data: json.decode(await _readResponse(response)),
      );
    }
  }

  Future<String> _readResponse(StreamedResponse response) {
    final Completer<String> completer = Completer();
    final buffer = StringBuffer();
    response.stream.transform(utf8.decoder).listen(
      (data) => buffer.write(data),
      onDone: () {
        final jsonData = json.decode(buffer.toString());
        completer.complete(jsonData['image'] ?? "");
      },
    );
    return completer.future;
  }
}