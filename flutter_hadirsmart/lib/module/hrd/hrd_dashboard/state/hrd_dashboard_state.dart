import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyper_ui/model/get_attendance_status_today_response.dart';
import 'package:hyper_ui/model/get_user_by_id_response.dart';
part 'hrd_dashboard_state.freezed.dart';

@unfreezed
class HrdDashboardState with _$HrdDashboardState {
  factory HrdDashboardState({
    @Default(null) GetUserByIdResponse? getUserByIdResponse,
    @Default(null)
    GetAttendanceStatusTodayResponse? getAttendanceStatusTodayResponse,
  }) = _HrdDashboardState;
}
