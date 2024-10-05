import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/notifications_model.dart';
import '../manager/notifications/notifications_cubit.dart';
import 'notifications_list_item.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<NotificationsCubit>(context)
            .getNotifications(studentId: HomeView.studentId);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              if (state is NotificationsSuccess) {
                if (state.notificationsModel.status == 401) {
                  return invalidToken(context);
                } else if (state.notificationsModel.status == 403) {
                  return Center(child: Text(S.of(context).no_notifications));
                } else {
                  List<NotificationItem>? listNotifications =
                      state.notificationsModel.data;

                  if (listNotifications!.isNotEmpty) {
                    return ListView.separated(
                      itemBuilder: (context, index) => NotificationsListItem(
                        notificationItem: listNotifications[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: listNotifications.length,
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child:
                          Center(child: Text(S.of(context).no_notifications)),
                    );
                  }
                }
              } else if (state is NotificationsFailure) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: CustomErrorMassage(errorMassage: state.errorMassage),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: CustomLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
