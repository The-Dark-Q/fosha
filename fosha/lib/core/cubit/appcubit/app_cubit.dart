import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fosha/core/resources/routes.dart';
import 'package:fosha/services/user.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  User user = User();
  Future<void> login(context, username, password) async {
    emit(LoginLoadingState());
    await User.login(context, username, password).then((value) {
      user = User.fromJson(jsonDecode(value));
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }
}
