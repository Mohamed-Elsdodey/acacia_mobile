import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/childern/data/repositories/childern_repo_impl.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/reviews/data/repositories/reviews_repo_impl.dart';
import '../../features/schoolCode/data/repositories/school_code_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<SchoolCodeRepoImpl>(
    SchoolCodeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ChildernRepoImpl>(
    ChildernRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<ReviewsRepoImpl>(
    ReviewsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}