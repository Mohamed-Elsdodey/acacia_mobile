import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/weekly_message_model.dart';
import '../models/weeks_model.dart';

abstract class WeeklyMessageRepo {
  Future<Either<Failure, WeeklyMessageModel>> getWeeklyMessage(
      {required String month,
      required String weekNumber,
      required String startWeek,
      required String endWeek});
  Future<Either<Failure, WeeksModel>> getWeeks({required String month});
}
