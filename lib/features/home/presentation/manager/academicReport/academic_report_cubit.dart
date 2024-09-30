import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/academic_report_model.dart';
import '../../../data/repositories/home_repo.dart';

part 'academic_report_state.dart';

class AcademicReportCubit extends Cubit<AcademicReportState> {
  AcademicReportCubit(this.homeRepo) : super(AcademicReportInitial());
  final HomeRepo homeRepo;
  Future<void> getAcademicReport({
    required String month,
    required String studentId,
  }) async {
    emit(AcademicReportLoading());
    Either<Failure, AcademicReportModel> result =
        await homeRepo.getAcademicReport(month: month, studentId: studentId);
    result.fold((failure) {
      emit(AcademicReportFailure(failure.errorMassage));
    }, (result) {
      emit(AcademicReportSuccess(result));
    });
  }
}
