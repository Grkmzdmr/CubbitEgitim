import 'package:cubbit_egitim/core/services/api_service.dart';
import 'package:cubbit_egitim/core/services/api_service_impl.dart';
import 'package:cubbit_egitim/features/data/data_sources/remote_datasource.dart';
import 'package:cubbit_egitim/features/data/repositories/login_repo_impl.dart';
import 'package:cubbit_egitim/features/domain/repositories/loginRepository.dart';
import 'package:cubbit_egitim/features/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt instance = GetIt.instance;

void appSetup() {
  instance.registerSingleton<Dio>(Dio());
  instance.registerLazySingleton<ApiService>(() => ApiServiceImpl());
  instance.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl());
  instance.registerSingleton<LoginRepository>(LoginRepoImpl());
  instance.registerSingleton<LoginUseCase>(LoginUseCase());
}
