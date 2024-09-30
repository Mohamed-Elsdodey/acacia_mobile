import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation_and_follow_up/core/helper/SharedPreferences/pref.dart';
import 'package:evaluation_and_follow_up/core/utils/app_strings.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/login_model.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      Map<String, dynamic> data = await apiService.post(
        host: schoolDomain,
        endPoint: "parent/auth/login",
        data: FormData.fromMap({
          "email": email,
          "password": password,
        }),
        headers: null,
      );
      LoginModel loginModel = LoginModel.fromJson(data);
      return right(loginModel);
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
