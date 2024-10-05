import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/schedules_model.dart';
import '../models/sessions_model.dart';

abstract class SchedulesRepo {
  Future<Either<Failure, List<SchedulesModel>>> getSchedules();
  Future<Either<Failure, SessionsModel>> getSessions();
}
