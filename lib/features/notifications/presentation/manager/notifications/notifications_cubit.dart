import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/notifications_model.dart';
import '../../../data/repositories/notifications_repo.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitial());
  final NotificationsRepo notificationsRepo;
  Future<void> getNotifications({required int studentId}) async {
    emit(NotificationsLoading());
    Either<Failure, NotificationsModel> result =
        await notificationsRepo.getNotifications(studentId: studentId);
    result.fold((failure) {
      emit(NotificationsFailure(failure.errorMassage));
    }, (result) {
      emit(NotificationsSuccess(result));
    });
  }
}