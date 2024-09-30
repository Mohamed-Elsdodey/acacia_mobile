import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    Either<Failure, LoginModel> result =
        await loginRepo.login(email: email, password: password);
    result.fold((failure) {
      emit(LoginFailure(failure.errorMassage));
    }, (result) {
      emit(LoginSuccess(result));
    });
  }
}
