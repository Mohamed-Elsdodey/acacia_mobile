import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation_and_follow_up/core/errors/failures.dart';
import 'package:evaluation_and_follow_up/core/utils/api_service.dart';
import 'package:evaluation_and_follow_up/features/schoolCode/data/models/school_code_model.dart';

import 'school_code_repo.dart';

class SchoolCodeRepoImpl implements SchoolCodeRepo {
  ApiService apiService;

  SchoolCodeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SchoolCodeModel>> schoolByCode(
      {required String code}) async {
    try {
      Map<String, dynamic> data = await apiService.post(
        host: "https://arabicinnovate.com",
        endPoint: "settings/get_school?code=$code",
        data: null,
        headers: {
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate, br',
          'Connection': 'keep-alive',
          'Content-Length': '0',
          'Content-Type': 'application/json'
        },
      );
      SchoolCodeModel schoolCodeModel = SchoolCodeModel.fromJson(data);
      return right(schoolCodeModel);
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
