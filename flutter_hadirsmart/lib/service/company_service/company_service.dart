import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/get_company_by_id_response.dart';

class CompanyService {
  Future<GetCompanyByIdResponse> getCompanyById(int id) async {
    printr("current $role id = $id");
    try {
      var response = await Dio().get(
        "$baseUrl/api/companies/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
      );
      printg("current === ${response.data.toString()}");
      return GetCompanyByIdResponse.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> update({
    required int id,
    String? photo,
    String? companyName,
    String? address,
    String? description,
    double? latitude,
    double? longitude,
    String? workingHourStart,
    String? workingHourEnd,
  }) async {
    try {
      var response = await Dio().put(
        "$baseUrl/api/companies/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
        data: {
          "company_name": companyName,
          "description": description,
          "photo": photo,
          "address": address,
          "latitude": latitude,
          "longitude": longitude,
          "working_hour_start": workingHourStart,
          "working_hour_end": workingHourEnd,
        },
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
