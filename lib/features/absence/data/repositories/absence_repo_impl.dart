import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/absence_model.dart';
import 'absence_repo.dart';

class AbsenceRepoImpl implements AbsenceRepo {
  ApiService apiService;

  AbsenceRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AbsenceModel>> getAbsence(
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
        endPoint:
            "student/getAbsencesByMonth?student_id=$childernId&month=$month",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,

        },
      );
      AbsenceModel absenceModel = AbsenceModel.fromJson(data);
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
