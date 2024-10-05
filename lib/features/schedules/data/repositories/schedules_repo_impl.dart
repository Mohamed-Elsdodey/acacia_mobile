import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/schedules_model.dart';
import '../models/sessions_model.dart';
import 'schedules_repo.dart';

class SchedulesRepoImpl implements SchedulesRepo {
  ApiService apiService;

  SchedulesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<SchedulesModel>>> getSchedules() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      int studentId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      var data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/schedules?student_id=$studentId",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      List<SchedulesModel> listSchedules = [];
      if (data is List) {
        for (var i in data) {
          listSchedules.add(SchedulesModel.fromJson(i));
        }
      } else if (data is Map) {
        listSchedules = [];
      }
      return right(listSchedules);
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

  @override
  Future<Either<Failure, SessionsModel>> getSessions() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/sessions",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      SessionsModel sessionsModel = SessionsModel.fromJson(data);
      return right(sessionsModel);
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
