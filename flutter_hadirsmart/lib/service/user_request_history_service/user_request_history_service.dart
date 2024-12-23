import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/model/get_user_request_history_response.dart';

class UserRequestHistoryService {
  Future<GetUserRequestHistoryResponse> getHistories({
    int? page,
    required String requestType,
    required String status,
  }) async {
    try {
      // http://localhost:8000/api/user-request-histories?limit=50&sort_field=role&sort_type=asc&page=1
      var response = await Dio().get(
        "$baseUrl/api/user-request-histories?page=$page&request_type=$requestType&status=$status",
        // "$baseUrl/api/user-request-histories?limit=50&sort_type=desc&page=1",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
      );
      printg("GetUserRequestHistoryResponse === ${response.data.toString()}");
      return GetUserRequestHistoryResponse.fromJson(response.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  //? create request face training form
  Future<void> create({
    required String requestType,
    String? attachment,
    DateTime? requestDate,
    String? description,
    double? amount,
  }) async {
    try {
      var response = await Dio().post("$baseUrl/api/user-request-histories",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer ${token}",
            },
          ),
          data: {
            "request_type": requestType,
            "attachment": attachment,
            "request_date": (requestDate ?? DateTime.now()).yMd,
            "description": description,
            "amount": amount,
            "status": "Pending"
          });
      printg("request face training === ${response.data.toString()}");
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> approve({
    required int id,
    // required String status,
  }) async {
    try {
      await Dio().put(
        "$baseUrl/api/user-request-histories/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
        data: {
          "status": "Approved",
          "update_status_date": DateTime.now().yMd,
        },
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> reject({
    required int id,
    // required String status,
    required String rejectedNote,
  }) async {
    try {
      await Dio().put(
        "$baseUrl/api/user-request-histories/$id",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token}",
          },
        ),
        data: {
          "status": "Rejected",
          "rejected_note": rejectedNote,
          "update_status_date": DateTime.now().yMd,
        },
      );
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  // Future<void> update({
  //   required int id,
  //   String? photo,
  //   String? companyName,
  //   String? address,
  //   String? description,
  //   double? latitude,
  //   double? longitude,
  //   String? workingHourStart,
  //   String? workingHourEnd,
  // }) async {
  //   try {
  //     await Dio().put(
  //       "$baseUrl/api/companies/$id",
  //       options: Options(
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": "Bearer ${token}",
  //         },
  //       ),
  //       data: {
  //         "company_name": companyName,
  //         "description": description,
  //         "photo": photo,
  //         "address": address,
  //         "latitude": latitude,
  //         "longitude": longitude,
  //         "working_hour_start": workingHourStart,
  //         "working_hour_end": workingHourEnd,
  //       },
  //     );
  //   } on Exception catch (err) {
  //     throw Exception(err);
  //   }
  // }
}
