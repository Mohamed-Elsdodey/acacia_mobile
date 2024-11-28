import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/home_work_model.dart';
import 'home_work_repo.dart';

class HomeWorkRepoImpl implements HomeWorkRepo {
  ApiService apiService;

  HomeWorkRepoImpl(this.apiService);

  @override
  Future<Either<Failure, HomeWorkModel>> getHomeWork({
    required String month,
    required String year,
    required String day,

  }) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";
      int studentId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;

      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint:
            "student/home_work?year=$year&month=$month&day=$day&student_id=$studentId",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );

      HomeWorkModel homeWorkModel = HomeWorkModel.fromJson(data);
      print("$homeWorkModel");
      return right(homeWorkModel);

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
