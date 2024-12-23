import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_request_detail_state.freezed.dart';

@unfreezed
class UserRequestDetailState with _$UserRequestDetailState {
  factory UserRequestDetailState({
    @Default(null) String? requestType,
  }) = _UserRequestDetailState;
}
