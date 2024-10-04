import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/absence_model.dart';
import '../../../data/repositories/absence_repo.dart';

part 'absence_state.dart';

class AbsenceCubit extends Cubit<AbsenceState> {
  AbsenceCubit(this.absenceRepo) : super(AbsenceInitial());
  final AbsenceRepo absenceRepo;
  Future<void> getAbsence({required String month}) async {
    emit(AbsenceLoading());
    Either<Failure, AbsenceModel> result =
        await absenceRepo.getAbsence(month: month);
    result.fold((failure) {
      emit(AbsenceFailure(failure.errorMassage));
    }, (result) {
      emit(AbsenceSuccess(result));
    });
  }
}
