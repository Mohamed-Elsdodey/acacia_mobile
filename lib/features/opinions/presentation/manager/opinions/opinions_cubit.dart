import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/opinions_model.dart';
import '../../../data/repositories/opinions_repo.dart';

part 'opinion_state.dart';

class OpinionsCubit extends Cubit<OpinionsState> {
  OpinionsCubit(this.opinionsRepo) : super(OpinionsInitial());
  final OpinionsRepo opinionsRepo;
  Future<void> getOpinions() async {
    emit(OpinionsLoading());
    Either<Failure, OpinionsModel> result = await opinionsRepo.getOpinions();
    result.fold((failure) {
      emit(OpinionsFailure(failure.errorMassage));
    }, (result) {
      emit(OpinionsSuccess(result));
    });
  }
}
