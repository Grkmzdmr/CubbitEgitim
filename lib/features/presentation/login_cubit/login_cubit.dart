import 'package:cubbit_egitim/core/failures_succeses/failures.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/domain/entities/login.dart';
import 'package:cubbit_egitim/features/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

  final LoginUseCase _loginUseCase = instance<LoginUseCase>();

  void login(String? sign, String? password, String? deviceId,
      int userDeviceTypeId) async {
    emit(LoginLoading());

    final Either<Failure, LoginResponseData> loginResponse =
        await _loginUseCase.login(sign, password, deviceId, userDeviceTypeId);

    loginResponse.fold((error) {
      emit(LoginError());
      print(error.message);
    }, (data) {
      emit(LoginComplete(loginResponseData: data));
    });
  }



  
}
