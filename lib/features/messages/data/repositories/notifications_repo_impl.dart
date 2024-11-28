import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/messages_model.dart';
import 'messages_repo.dart';

class MessagesRepoImpl implements MessagesRepo {
  ApiService apiService;

  MessagesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MessagesModel>> getMessages() async {
    try {
      String schoolDomain =
          await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";

      String token =
          await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";

      int id = await Pref.getIntFromPref(key: AppStrings.childernIdKey) ?? -1;

      String lang =
          await Pref.getStringFromPref(key: AppStrings.langKey) ?? "ar";
      Map<String, dynamic> data = await apiService.get(
        host: schoolDomain,
        endPoint: "student/getMessages?student_id=$id",
        headers: {
          "Authorization": "Bearer $token",
          "lang": lang,
        },
      );
      MessagesModel messagesModel = MessagesModel.fromJson(data);
      return right(messagesModel);
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
