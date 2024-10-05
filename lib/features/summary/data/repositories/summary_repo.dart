import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/summary_model.dart';

abstract class SummaryRepo {
  Future<Either<Failure, SummaryModel>> getSummary();
}
