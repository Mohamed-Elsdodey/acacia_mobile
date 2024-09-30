import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:evaluation_and_follow_up/features/schoolCode/data/repositories/school_code_repo.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/school_code_model.dart';

part 'school_code_state.dart';

class SchoolCodeCubit extends Cubit<SchoolCodeState> {
  SchoolCodeCubit(this.schoolCodeRepo) : super(SchoolCodeInitial());
  final SchoolCodeRepo schoolCodeRepo;
  Future<void> getSchoolByCode({required String code}) async {
    emit(SchoolCodeLoading());
    Either<Failure, SchoolCodeModel> result =
        await schoolCodeRepo.schoolByCode(code: code);
    result.fold((failure) {
      emit(SchoolCodeFailure(failure.errorMassage));
    }, (result) {
      emit(SchoolCodeSuccess(result));
    });
  }
}
