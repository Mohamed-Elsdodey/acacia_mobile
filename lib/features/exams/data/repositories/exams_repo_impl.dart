import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/exams_model.dart';
import 'exams_repo.dart';

class ExamsRepoImpl implements ExamsRepo {
  ApiService apiService;

  ExamsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ExamsModel>> getExams() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      int childernId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/getExams?student_id=$childernId",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      ExamsModel examsModel = ExamsModel.fromJson(data);
      return right(examsModel);
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
