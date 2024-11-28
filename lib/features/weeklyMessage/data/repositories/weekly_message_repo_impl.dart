import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation_and_follow_up/features/weeklyMessage/data/models/weeks_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/weekly_message_model.dart';
import 'weekly_message_repo.dart';

class WeeklyMessageRepoImpl implements WeeklyMessageRepo {
  ApiService apiService;

  WeeklyMessageRepoImpl(this.apiService);

  @override
  Future<Either<Failure, WeeklyMessageModel>> getWeeklyMessage({
    required String month,
    required String weekNumber,
    required String startWeek,
    required String endWeek,
  }) async {
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
            "student/weekly_messages?month=$month&week_number=$weekNumber&start_week_date=$startWeek&end_week_date=$endWeek&student_id=$studentId",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );

      WeeklyMessageModel weeklyMessageModel = WeeklyMessageModel.fromJson(data);
      return right(weeklyMessageModel);
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
  Future<Either<Failure, WeeksModel>> getWeeks({required String month}) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";

      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/weeks_by_month?month=$month",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );

      WeeksModel weeksModel = WeeksModel.fromJson(data);
      return right(weeksModel);
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
