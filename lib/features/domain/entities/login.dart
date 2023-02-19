

//Bu objenin içeriği,tipi
class LoginResponse {
  final int? id;
  final String? sign;
  final String? token;

  const LoginResponse({this.id, this.sign, this.token});
}

//Datada bu objeden ne kadar dönüyor
class LoginResponseData {
  final LoginResponse? data;
  final bool? succes;

  const LoginResponseData({this.data, this.succes});
}
