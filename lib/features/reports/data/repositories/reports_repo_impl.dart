import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/reports_model.dart';
import 'reports_repo.dart';

class ReportsRepoImpl implements ReportsRepo {
  ApiService apiService;

  ReportsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ReportsModel>> getReports(
      {required String month}) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";

      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";
      int childernId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/getGraduates?student_id=$childernId&month=$month",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );
      ReportsModel absenceModel = ReportsModel.fromJson(data);
      return right(absenceModel);
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
