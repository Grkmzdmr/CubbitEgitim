import 'package:cubbit_egitim/features/domain/entities/login.dart';

class LoginModel extends LoginResponse {
  LoginModel({int? id, String? sign, String? token})
      : super(id: id, sign: sign, token: token);

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(id: map['id'], sign: map['sign'], token: map['token']);
  }
}

class LoginModelData extends LoginResponseData {
  LoginModelData({LoginResponse? data, bool? success})
      : super(data: data, succes: success);

  factory LoginModelData.fromMap(Map<String, dynamic> map) {
    return LoginModelData(
      data: LoginModel.fromMap(map['data']),
      success: map['success']




    );
  }
}
