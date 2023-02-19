import 'package:cubbit_egitim/core/consts/apiconst.dart';
import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/services/api_service.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/models/login_model.dart';

abstract class RemoteDataSource {
  Future<LoginModelData> login(
      String? sign, String? password, String? deviceId, int userDeviceTypeId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService _apiService = instance<ApiService>();




  @override
  Future<LoginModelData> login(String? sign, String? password, String? deviceId,
      int userDeviceTypeId) async {
    try {
      Map<String, dynamic> data =
          await _apiService.getData(ApiConsts.loginUrl, {
        'sign': '$sign',
        'password': '$password',
        'deviceId': '$deviceId',
        'userDeviceTypeId': '$userDeviceTypeId'
      });

      LoginModel loginModel = LoginModel.fromMap(data['data']);
      LoginModelData loginModelData = LoginModelData.fromMap(data);
      return loginModelData;
    } catch (e) {
      throw LoginException(message: 'Giriş Yapılamadı');
    }
  }

  







  
}
