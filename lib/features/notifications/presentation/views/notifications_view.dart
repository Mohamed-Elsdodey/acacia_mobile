import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/notifications_repo_impl.dart';
import '../manager/notifications/notifications_cubit.dart';
import '../widgets/notifications_view_body.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key, required this.studentId});
  final int studentId;

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit(
        getIt.get<NotificationsRepoImpl>(),
      )..getNotifications(studentId: widget.studentId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              GoTo.pop(context);
            },
          ),
          title: Text(
            S.of(context).notifications,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const NotificationsViewBody(),
      ),
    );
  }
}
