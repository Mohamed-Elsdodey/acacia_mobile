import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/notifications_model.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  ApiService apiService;

  NotificationsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, NotificationsModel>> getNotifications(
      {required int studentId}) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/getNotifications?student_id=$studentId",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      NotificationsModel notificationsModel = NotificationsModel.fromJson(data);
      return right(notificationsModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
