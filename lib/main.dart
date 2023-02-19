import 'package:cubbit_egitim/core/consts/appsize.dart';
import 'package:cubbit_egitim/core/consts/colors.dart';
import 'package:cubbit_egitim/core/consts/strings.dart';
import 'package:cubbit_egitim/core/services/services_locator.dart';
import 'package:cubbit_egitim/features/presentation/login_cubit/login_cubit.dart';
import 'package:cubbit_egitim/features/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider(create: (context) {
        //       return LoginCubit();
        //     })
        //   ],
        //   child:
        MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: ColorsPalette.primary),
            home: Scaffold(body: LoginView()));
  }
}
