import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/reviews_model.dart';
import 'reviews_repo.dart';

class ReviewsRepoImpl implements ReviewsRepo {
  ApiService apiService;

  ReviewsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ReviewsModel>> getReviews() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      int childernId =
          await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;
      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/getReviews?student_id=$childernId",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );
      ReviewsModel reviewsModel = ReviewsModel.fromJson(data);
      return right(reviewsModel);
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
