import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/summary_model.dart';
import '../../../data/repositories/summary_repo.dart';

part 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit(this.summaryRepo) : super(SummaryInitial());
  final SummaryRepo summaryRepo;
  Future<void> getSummary() async {
    emit(SummaryLoading());
    Either<Failure, SummaryModel> result = await summaryRepo.getSummary();
    result.fold((failure) {
      emit(SummaryFailure(failure.errorMassage));
    }, (result) {
      emit(SummarySuccess(result));
    });
  }
}
