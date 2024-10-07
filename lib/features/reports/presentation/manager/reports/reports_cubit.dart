import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/reports_model.dart';
import '../../../data/repositories/reports_repo.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this.reportsRepo) : super(ReportsInitial());
  final ReportsRepo reportsRepo;
  Future<void> getReports({required String month}) async {
    emit(ReportsLoading());
    Either<Failure, ReportsModel> result =
        await reportsRepo.getReports(month: month);
    result.fold((failure) {
      emit(ReportsFailure(failure.errorMassage));
    }, (result) {
      emit(ReportsSuccess(result));
    });
  }
}
