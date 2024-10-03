import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/exams_model.dart';
import '../../../data/repositories/exams_repo.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit(this.examsRepo) : super(ExamsInitial());
  final ExamsRepo examsRepo;
  Future<void> getExams() async {
    emit(ExamsLoading());
    Either<Failure, ExamsModel> result = await examsRepo.getExams();
    result.fold((failure) {
      emit(ExamsFailure(failure.errorMassage));
    }, (result) {
      emit(ExamsSuccess(result));
    });
  }
}
