import 'package:evaluation_and_follow_up/core/utils/app_assets.dart';
import 'package:evaluation_and_follow_up/features/home/presentation/manager/childern/childern_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../notifications/presentation/views/notifications_view.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../manager/academicReport/academic_report_cubit.dart';
import '../manager/subjectReport/subject_report_cubit.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static int studentId = -1;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? lang;

  @override
  void didChangeDependencies() {
    lang = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChildernCubit(
            getIt.get<HomeRepoImpl>(),
          )..getChildern(),
        ),
        BlocProvider(
          create: (context) => AcademicReportCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => SubjectReportCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(DateFormat('EEEE dd-MM-yyyy', lang)
              .format(DateTime.now().toLocal())),
          actions: [
            InkWell(
              onTap: () {
                GoTo.push(
                    context, NotificationsView(studentId: HomeView.studentId));
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    AppAssets.notification,
                    color: Colors.black,
                  ),
                  const PositionedDirectional(
                    top: -2,
                    start: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 4,
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppAssets.massge,
                      color: Colors.black,
                    ),
                    const PositionedDirectional(
                      top: -2,
                      start: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
