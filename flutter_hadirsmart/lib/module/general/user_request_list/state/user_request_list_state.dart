import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyper_ui/model/get_user_request_history_response.dart';

part 'user_request_list_state.freezed.dart';

@unfreezed
class UserRequestListState with _$UserRequestListState {
  factory UserRequestListState({
    @Default(1) int page,
    @Default(true) bool loading,
    @Default([]) List<UserRequestHistory> items,
    @Default(null) String? requestType,
    @Default(null) String? rejectedNote,
    @Default("Pending") String? status,
    @Default(null) GetUserRequestHistoryResponse? getUserRequestHistoryResponse,
  }) = _UserRequestListState;
}
