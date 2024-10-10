import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/weeks_model.dart';
import '../../../data/repositories/weekly_message_repo.dart';

part 'weeks_state.dart';

class WeeksCubit extends Cubit<WeeksState> {
  WeeksCubit(this.weeklyMessageRepo) : super(WeeksInitial());
  final WeeklyMessageRepo weeklyMessageRepo;
  Future<void> getWeeks({required String month}) async {
    emit(WeeksLoading());
    Either<Failure, WeeksModel> result =
        await weeklyMessageRepo.getWeeks(month: month);
    result.fold((failure) {
      emit(WeeksFailure(failure.errorMassage));
    }, (result) {
      emit(WeeksSuccess(result));
    });
  }
}
