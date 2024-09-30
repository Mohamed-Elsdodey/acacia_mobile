import 'package:dartz/dartz.dart';
import 'package:evaluation_and_follow_up/features/schoolCode/data/models/school_code_model.dart';

import '../../../../core/errors/failures.dart';

abstract class SchoolCodeRepo {
  Future<Either<Failure, SchoolCodeModel>> schoolByCode({
    required String code,
  });
}
