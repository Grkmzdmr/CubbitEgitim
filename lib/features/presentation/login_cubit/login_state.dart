part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {}

class LoginComplete extends LoginState {
  final LoginResponseData loginResponseData;

  LoginComplete({required this.loginResponseData});
}
