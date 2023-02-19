import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/data_sources/remote_datasource.dart';
import 'package:cubbit_egitim/features/data/models/login_model.dart';
import 'package:cubbit_egitim/features/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseData>> login(
      String? sign, String? password, String? deviceId, int userDeviceTypeId);
}
