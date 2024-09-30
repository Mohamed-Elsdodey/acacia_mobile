import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/subject_report_model.dart';
import '../../../data/repositories/home_repo.dart';

part 'subject_report_state.dart';

class SubjectReportCubit extends Cubit<SubjectReportState> {
  SubjectReportCubit(this.homeRepo) : super(SubjectReportInitial());
  final HomeRepo homeRepo;
  Future<void> getSubjectReport({
    required String month,
    required String studentId,
  }) async {
    emit(SubjectReportLoading());
    Either<Failure, SubjectReportModel> result =
        await homeRepo.getSubjectReport(month: month, studentId: studentId);
    result.fold((failure) {
      emit(SubjectReportFailure(failure.errorMassage));
    }, (result) {
      emit(SubjectReportSuccess(result));
    });
  }
}
