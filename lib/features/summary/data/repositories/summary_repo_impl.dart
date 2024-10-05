import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/summary_model.dart';
import 'summary_repo.dart';

class SummaryRepoImpl implements SummaryRepo {
  ApiService apiService;

  SummaryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SummaryModel>> getSummary() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      int childernId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/examReport?student_id=$childernId",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      SummaryModel summaryModel = SummaryModel.fromJson(data);
      return right(summaryModel);
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
