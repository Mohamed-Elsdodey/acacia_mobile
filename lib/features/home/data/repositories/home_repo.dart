import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/models/childern_model.dart';
import '../models/academic_report_model.dart';
import '../models/subject_report_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, ChildernModel>> getChildern();
  Future<Either<Failure, AcademicReportModel>> getAcademicReport({
    required String month,
    required String studentId,
  });
  Future<Either<Failure, SubjectReportModel>> getSubjectReport({
    required String month,
    required String studentId,
  });
}
