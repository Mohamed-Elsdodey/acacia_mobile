import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/notifications_model.dart';
import '../manager/notifications/notifications_cubit.dart';
import 'notifications_list_item.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key, this.studentId});
  final int? studentId;
  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<NotificationsCubit>(context)
            .getNotifications(studentId: widget.studentId);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.r),
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
                    return Column(
                      children: [
                        ...List.generate(
                          listNotifications.length,
                          (index) {
                            return NotificationsListItem(
                              notificationItem: listNotifications[index],
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.r),
                      child:
                          Center(child: Text(S.of(context).no_notifications)),
                    );
                  }
                }
              } else if (state is NotificationsFailure) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: CustomErrorMassage(errorMassage: state.errorMassage),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: const CustomLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
