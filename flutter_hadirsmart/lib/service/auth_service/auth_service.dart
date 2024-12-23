import 'package:hyper_ui/core.dart';

import '../../env.dart';

String? get token => DBService.get("token");
String? get role => DBService.get("role");
int? get currentUserId => int.tryParse(DBService.get("id")!);
int? get currentUserCompanyId => int.tryParse(DBService.get("company_id")!);

bool get isEmployee => role == "Employee";
bool get isHRD => role == "HRD";
bool get isLoggedIn => token != null;

class AuthService {
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "$baseUrl/api/auth/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data;
      DBService.set("token", obj["data"]["token"]);
      DBService.set("role", obj["data"]["role"]);
      DBService.set("id", obj["data"]["id"].toString());
      DBService.set("company_id", obj["data"]["company_id"].toString());
      return true;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> logout() async {
    try {
      await Dio().post(
        "$baseUrl/api/auth/logout",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
      );
      DBService.clear("token");
      DBService.clear("role");
      return true;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
