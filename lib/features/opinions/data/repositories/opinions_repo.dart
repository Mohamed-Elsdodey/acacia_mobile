import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/opinions_model.dart';

abstract class OpinionsRepo {
  Future<Either<Failure, OpinionsModel>> getOpinions();
}
