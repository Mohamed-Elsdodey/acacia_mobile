import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/sessions_model.dart';
import '../../../data/repositories/schedules_repo.dart';

part 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit(this.schedulesRepo) : super(SessionsInitial());
  final SchedulesRepo schedulesRepo;
  Future<void> getSessions() async {
    emit(SessionsLoading());
    Either<Failure, SessionsModel> result = await schedulesRepo.getSessions();
    result.fold((failure) {
      emit(SessionsFailure(failure.errorMassage));
    }, (result) {
      emit(SessionsSuccess(result));
    });
  }
}
