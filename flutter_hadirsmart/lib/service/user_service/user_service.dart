import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/get_user_by_id_response.dart';

class UserService {
  Future<GetUserByIdResponse> getUserById(int id) async {
    printr("current $role id = $id");
    try {
      var response = await Dio().get(
        "$baseUrl/api/users/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
      );
      return GetUserByIdResponse.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> update({
    required int id,
    required String name,
  }) async {
    try {
      await Dio().put(
        "$baseUrl/api/users/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
        data: {
          "name": name,
        },
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
