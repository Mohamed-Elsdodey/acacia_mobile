import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/absence/data/repositories/absence_repo_impl.dart';
import '../../features/childern/data/repositories/childern_repo_impl.dart';
import '../../features/dataAccount/data/repositories/data_account_repo_impl.dart';
import '../../features/exams/data/repositories/exams_repo_impl.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/notifications/data/repositories/notifications_repo_impl.dart';
import '../../features/reports/data/repositories/reports_repo_impl.dart';
import '../../features/reviews/data/repositories/reviews_repo_impl.dart';
import '../../features/schedules/data/repositories/schedules_repo_impl.dart';
import '../../features/schoolCode/data/repositories/school_code_repo_impl.dart';
import '../../features/summary/data/repositories/summary_repo_impl.dart';
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
  getIt.registerSingleton<ExamsRepoImpl>(
    ExamsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<NotificationsRepoImpl>(
    NotificationsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<DataAccountRepoImpl>(
    DataAccountRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<AbsenceRepoImpl>(
    AbsenceRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SchedulesRepoImpl>(
    SchedulesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SummaryRepoImpl>(
    SummaryRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<ReportsRepoImpl>(
    ReportsRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
