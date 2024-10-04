import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/absence_model.dart';

abstract class AbsenceRepo {
  Future<Either<Failure, AbsenceModel>> getAbsence({required String month});
}
