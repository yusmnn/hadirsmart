import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import '../state/login_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class LoginController extends Cubit<LoginState> implements IBlocBase {
  LoginController() : super(LoginState());

  @override
  void initState() {
    // if (kDebugMode) {
    //   // state.email = "user4.alphawaveinc@demo.com";
    //   // state.password = "123456";
    //   state.email = "hrd2.alphawaveinc@demo.com";
    //   state.password = "123456";
    //   emit(state.copyWith());
    // }
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  login() async {
    showLoading();
    try {
      bool isLoggedIn = await AuthService().login(
        email: state.email,
        password: state.password,
      );
      //snackbarSuccess
      ss("Login success");
      hideLoading();
      if (isEmployee) {
        Get.offAll(EmployeeMainNavigationView());
      } else if (isHRD) {
        Get.offAll(HrdMainNavigationView());
      }
    } on Exception catch (err) {
      //snackbarError
      debugPrint(err.toString());
      se("Login failed");
    }
  }
}
