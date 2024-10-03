import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/data_account_model.dart';
import '../../../data/repositories/data_account_repo.dart';

part 'data_account_state.dart';

class DataAccountCubit extends Cubit<DataAccountState> {
  DataAccountCubit(this.dataAccountRepo) : super(DataAccountInitial());
  final DataAccountRepo dataAccountRepo;
  Future<void> upDateDataAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(DataAccountLoading());
    Either<Failure, DataAccountModel> result = await dataAccountRepo
        .upDateDataAccount(name: name, email: email, password: password);
    result.fold((failure) {
      emit(DataAccountFailure(failure.errorMassage));
    }, (result) {
      emit(DataAccountSuccess(result));
    });
  }
}
