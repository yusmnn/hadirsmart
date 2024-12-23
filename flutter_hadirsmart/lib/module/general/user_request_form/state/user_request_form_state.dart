import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_request_form_state.freezed.dart';

@unfreezed
class UserRequestFormState with _$UserRequestFormState {
  factory UserRequestFormState({
    @Default(null) String? attachment,
    @Default(null) DateTime? requestDate,
    @Default(null) String? requestType,
    @Default(null) double? amount,
    @Default(null) DateTime? fromDate,
    @Default(null) DateTime? toDate,
    @Default(null) String? description,
  }) = _UserRequestFormState;
}
