import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluation_and_follow_up/core/helper/SharedPreferences/pref.dart';
import 'package:evaluation_and_follow_up/core/utils/app_strings.dart';
import 'package:evaluation_and_follow_up/features/home/data/models/academic_report_model.dart';
import 'package:evaluation_and_follow_up/features/home/data/models/subject_report_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/childern_model.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;

  HomeRepoImpl(this.apiService);

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

  @override
  Future<Either<Failure, AcademicReportModel>> getAcademicReport({
    required String month,
    required String studentId,
  }) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint:
            "student/behavioral_academic_report?student_id=$studentId&month=$month",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      AcademicReportModel academicReportModel =
          AcademicReportModel.fromJson(data);
      return right(academicReportModel);
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
  Future<Either<Failure, SubjectReportModel>> getSubjectReport({
    required String month,
    required String studentId,
  }) async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/category_reports?student_id=$studentId&month=$month",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      SubjectReportModel subjectReportModel = SubjectReportModel.fromJson(data);
      return right(subjectReportModel);
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
