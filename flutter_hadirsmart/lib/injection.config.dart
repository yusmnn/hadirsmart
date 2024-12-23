// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'module/auth/login/controller/login_controller.dart' as _i994;
import 'module/employee/employee_dashboard/controller/employee_dashboard_controller.dart'
    as _i973;
import 'module/employee/employee_edit_profile_form/controller/employee_edit_profile_form_controller.dart'
    as _i67;
import 'module/employee/employee_main_navigation/controller/employee_main_navigation_controller.dart'
    as _i970;
import 'module/employee/employee_profile/controller/employee_profile_controller.dart'
    as _i38;
import 'module/general/user_request_detail/controller/user_request_detail_controller.dart'
    as _i802;
import 'module/general/user_request_form/controller/user_request_form_controller.dart'
    as _i265;
import 'module/general/user_request_list/controller/user_request_list_controller.dart'
    as _i132;
import 'module/general/user_request_reject_popup/controller/user_request_reject_popup_controller.dart'
    as _i429;
import 'module/hrd/hrd_dashboard/controller/hrd_dashboard_controller.dart'
    as _i904;
import 'module/hrd/hrd_edit_company_form/controller/hrd_edit_company_form_controller.dart'
    as _i576;
import 'module/hrd/hrd_edit_profile_form/controller/hrd_edit_profile_form_controller.dart'
    as _i811;
import 'module/hrd/hrd_main_navigation/controller/hrd_main_navigation_controller.dart'
    as _i994;
import 'module/hrd/hrd_profile/controller/hrd_profile_controller.dart' as _i574;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i994.LoginController>(() => _i994.LoginController());
    gh.singleton<_i973.EmployeeDashboardController>(
        () => _i973.EmployeeDashboardController());
    gh.singleton<_i67.EmployeeEditProfileFormController>(
        () => _i67.EmployeeEditProfileFormController());
    gh.singleton<_i970.EmployeeMainNavigationController>(
        () => _i970.EmployeeMainNavigationController());
    gh.singleton<_i38.EmployeeProfileController>(
        () => _i38.EmployeeProfileController());
    gh.singleton<_i802.UserRequestDetailController>(
        () => _i802.UserRequestDetailController());
    gh.singleton<_i265.UserRequestFormController>(
        () => _i265.UserRequestFormController());
    gh.singleton<_i132.UserRequestListController>(
        () => _i132.UserRequestListController());
    gh.singleton<_i429.UserRequestRejectPopupController>(
        () => _i429.UserRequestRejectPopupController());
    gh.singleton<_i904.HrdDashboardController>(
        () => _i904.HrdDashboardController());
    gh.singleton<_i576.HrdEditCompanyFormController>(
        () => _i576.HrdEditCompanyFormController());
    gh.singleton<_i811.HrdEditProfileFormController>(
        () => _i811.HrdEditProfileFormController());
    gh.singleton<_i994.HrdMainNavigationController>(
        () => _i994.HrdMainNavigationController());
    gh.singleton<_i574.HrdProfileController>(
        () => _i574.HrdProfileController());
    return this;
  }
}
