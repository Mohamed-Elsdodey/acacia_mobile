import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/exams_model.dart';

abstract class ExamsRepo {
  Future<Either<Failure, ExamsModel>> getExams();
}
