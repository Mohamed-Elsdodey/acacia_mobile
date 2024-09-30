import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/models/childern_model.dart';
import '../../../data/repositories/childern_repo.dart';

part 'childern_state.dart';

class ChildernCubit extends Cubit<ChildernState> {
  ChildernCubit(this.childernRepo) : super(ChildernInitial());
  final ChildernRepo childernRepo;
  Future<void> getChildern() async {
    emit(ChildernLoading());
    Either<Failure, ChildernModel> result = await childernRepo.getChildern();
    result.fold((failure) {
      emit(ChildernFailure(failure.errorMassage));
    }, (result) {
      emit(ChildernSuccess(result));
    });
  }
}
