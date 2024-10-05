import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/schedules_model.dart';
import '../../../data/repositories/schedules_repo.dart';

part 'schedules_state.dart';

class SchedulesCubit extends Cubit<SchedulesState> {
  SchedulesCubit(this.schedulesRepo) : super(SchedulesInitial());
  final SchedulesRepo schedulesRepo;
  Future<void> getSchedules() async {
    emit(SchedulesLoading());
    Either<Failure, List<SchedulesModel>> result =
        await schedulesRepo.getSchedules();
    result.fold((failure) {
      emit(SchedulesFailure(failure.errorMassage));
    }, (result) {
      emit(SchedulesSuccess(result));
    });
  }
}
