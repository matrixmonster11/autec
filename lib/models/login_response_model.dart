import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.expiresIn,
    required this.userId,
    required this.userType,
    required this.userName,
  });
  late final String token;
  late final int expiresIn;
  late final String userId;
  late final String userType;
  late final String userName;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expiresIn'];
    userId = json['userId'];
    userType = json['userType'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['expiresIn'] = expiresIn;
    _data['userId'] = userId;
    _data['userType'] = userType;
    _data['userName'] = userName;
    return _data;
  }
}
