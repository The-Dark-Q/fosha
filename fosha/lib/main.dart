import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fosha/core/cubit/appcubit/app_cubit.dart';
import 'package:fosha/core/resources/bloc_observer.dart';
import 'package:fosha/core/resources/get_it.dart';
import 'package:fosha/core/resources/routes.dart';
import 'package:fosha/screens/home/home.dart';
import 'package:fosha/screens/login/login.dart';
import 'package:fosha/screens/sign_up/sign_up.dart';
import 'package:fosha/screens/welcome/welcome.dart';
import 'package:fosha/utils.dart';

void main() {
  String currentScreen = AppRoutes.welcomeScreen;
  Bloc.observer = MyBlocObserver();
  // if (getXkey.isEmpty) {
  //   currentScreen = AppRoutes.loginScreen;
  // } else {
  //   currentScreen = AppRoutes.mainScreen;
  // }
  runApp(MyApp(currentScreen: currentScreen));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.currentScreen});
  final String currentScreen;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fosha',
      initialRoute: currentScreen,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.homeScreen: (context) {
          initAppCubit();
          return BlocProvider(
            create: (context) => instance.get<AppCubit>(),
            child: const HomePage(),
          );
        },
        AppRoutes.welcomeScreen: (context) {
          initAppCubit();
          return BlocProvider(
            create: (context) => instance.get<AppCubit>(),
            child: const Welcome(),
          );
        },
        AppRoutes.loginScreen: (context) {
          initAppCubit();
          return BlocProvider(
            create: (context) => instance.get<AppCubit>(),
            child: const Login(),
          );
        },
        AppRoutes.signUpScreen: (context) {
          initAppCubit();
          return BlocProvider(
            create: (context) => instance.get<AppCubit>(),
            child: const SignUp(),
          );
        }
      },
    );
  }
}
