import 'package:cubbit_egitim/core/failures_succeses/exceptions.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/data/data_sources/remote_datasource.dart';
import 'package:cubbit_egitim/features/data/models/login_model.dart';
import 'package:cubbit_egitim/features/domain/entities/login.dart';
import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/features/domain/repositories/loginRepository.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImpl implements LoginRepository {
  final RemoteDataSource remoteDataSource = instance<RemoteDataSource>();

  @override
  Future<Either<Failure, LoginModelData>> login(
      String? sign, String? password, String? deviceId, int userDeviceTypeId) async{

        try{
          return Right(await remoteDataSource.login(sign, password, deviceId, userDeviceTypeId));

        }on LoginException catch(e){

          return Left(FetchFailure(messsage: e.message));

        }



      }
}
