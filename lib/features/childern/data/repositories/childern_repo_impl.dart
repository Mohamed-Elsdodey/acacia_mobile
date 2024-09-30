import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/models/childern_model.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import 'childern_repo.dart';

class ChildernRepoImpl implements ChildernRepo {
  ApiService apiService;

  ChildernRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ChildernModel>> getChildern() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/children",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      ChildernModel childernModel = ChildernModel.fromJson(data);
      return right(childernModel);
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
