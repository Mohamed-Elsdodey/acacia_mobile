import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/opinions_model.dart';
import 'opinions_repo.dart';

class OpinionsRepoImpl implements OpinionsRepo {
  ApiService apiService;

  OpinionsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, OpinionsModel>> getOpinions() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";

      int studentId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint:
            "student/student_performance_evaluations?student_id=$studentId",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );

      print("============================================");
      OpinionsModel opinionsModel = OpinionsModel.fromJson(data);
      return right(opinionsModel);
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
