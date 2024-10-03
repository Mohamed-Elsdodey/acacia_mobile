import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation_and_follow_up/core/helper/SharedPreferences/pref.dart';
import 'package:evaluation_and_follow_up/core/utils/app_strings.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/data_account_model.dart';
import 'data_account_repo.dart';

class DataAccountRepoImpl implements DataAccountRepo {
  ApiService apiService;

  DataAccountRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DataAccountModel>> upDateDataAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.post(
        host: schoolDomain,
        endPoint: "parent/auth/update/profile",
        data: FormData.fromMap({
          "name": name,
          "email": email,
          "password": password,
        }),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      DataAccountModel dataAccountModel = DataAccountModel.fromJson(data);
      return right(dataAccountModel);
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
