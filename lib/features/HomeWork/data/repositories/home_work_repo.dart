import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/home_work_model.dart';

abstract class HomeWorkRepo {
  Future<Either<Failure, HomeWorkModel>> getHomeWork(
      {required String month,
      required String day,
      required String year,

      });
}
