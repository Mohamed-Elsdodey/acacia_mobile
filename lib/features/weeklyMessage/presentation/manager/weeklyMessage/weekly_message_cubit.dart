import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/weekly_message_model.dart';
import '../../../data/repositories/weekly_message_repo.dart';

part 'weekly_message_state.dart';

class WeeklyMessageCubit extends Cubit<WeeklyMessageState> {
  WeeklyMessageCubit(this.weeklyMessageRepo) : super(WeeklyMessageInitial());
  final WeeklyMessageRepo weeklyMessageRepo;
  Future<void> getWeeklyMessage(
      {required String month,
      required String weekNumber,
      required String startWeek,
      required String endWeek}) async {
    emit(WeeklyMessageLoading());
    Either<Failure, WeeklyMessageModel> result =
        await weeklyMessageRepo.getWeeklyMessage(
            month: month,
            weekNumber: weekNumber,
            startWeek: startWeek,
            endWeek: endWeek);
    result.fold((failure) {
      emit(WeeklyMessageFailure(failure.errorMassage));
    }, (result) {
      emit(WeeklyMessageSuccess(result));
    });
  }
}
