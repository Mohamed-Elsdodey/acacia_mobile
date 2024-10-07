import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/reports_model.dart';

abstract class ReportsRepo {
  Future<Either<Failure, ReportsModel>> getReports({required String month});
}
