import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/service/auth_service/auth_service.dart';
import '../state/hrd_profile_state.dart';
import 'package:hyper_ui/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class HrdProfileController extends Cubit<HrdProfileState> implements IBlocBase {
  HrdProfileController() : super(HrdProfileState());

  @override
  void initState() {
    //initState event
    getCurrentUserData();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  getCurrentUserData() async {
    state.getUserByIdResponse = null;
    emit(state.copyWith());

    state.getUserByIdResponse = await UserService().getUserById(currentUserId!);
    emit(state.copyWith());
  }

  logout() async {
    showLoading();
    await AuthService().logout();
    hideLoading();
    Get.offAll(LoginView());
  }
}
