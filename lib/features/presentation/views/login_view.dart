import 'package:cubbit_egitim/core/consts/colors.dart';
import 'package:cubbit_egitim/features/presentation/login_cubit/login_cubit.dart';
import 'package:cubbit_egitim/features/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text("Giriş Sayfasına Hoşgeldiniz"),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(label: Text("Kullanıcı Adı")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(label: Text("Şifre")),
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginComplete) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainView()));
                }

                if (state is LoginError) {
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                    titleText: Text(
                      "Oops, Giriş Yapılamadı",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                    messageText: Text(
                      "Hop hemşerim nereye.",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontFamily: "ShadowsIntoLightTwo"),
                    ),
                  )..show(context);
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return SizedBox(
                      height: 160,
                      width: 160,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: Colors.black,
                      )));
                } else {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 38, right: 38, top: 26, bottom: 26),
                          backgroundColor: ColorsPalette.primary),
                      onPressed: () {
                        context.read<LoginCubit>().login(
                            _usernameController.text,
                            _passwordController.text,
                            "asdasd",
                            2);
                      },
                      child: Text("Giriş Yap"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
