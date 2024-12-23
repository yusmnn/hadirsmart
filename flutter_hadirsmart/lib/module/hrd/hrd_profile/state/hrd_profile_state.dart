import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyper_ui/model/get_user_by_id_response.dart';
part 'hrd_profile_state.freezed.dart';

@unfreezed
class HrdProfileState with _$HrdProfileState {
  factory HrdProfileState({
    @Default(null) GetUserByIdResponse? getUserByIdResponse,
  }) = _HrdProfileState;
}
