import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/views/home_view.dart';
import '../../../notifications/presentation/views/notifications_view.dart';
import '../../data/repositories/childern_repo_impl.dart';
import '../manager/childern/childern_cubit.dart';
import '../widgets/childern_view_body.dart';

class ChildernView extends StatefulWidget {
  const ChildernView({super.key});

  @override
  State<ChildernView> createState() => _ChildernViewState();
}

class _ChildernViewState extends State<ChildernView> {
  String? lang;

  @override
  void didChangeDependencies() {
    lang = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChildernCubit(
        getIt.get<ChildernRepoImpl>(),
      )..getChildern(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            S.of(context).childern,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                GoTo.push(
                    context, NotificationsView(studentId: HomeView.studentId));
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 24.r),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppAssets.notification,
                      color: Colors.white,
                    ),
                    PositionedDirectional(
                      top: -2.h,
                      start: 0.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4.r,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: const ChildernViewBody(),
      ),
    );
  }
}
