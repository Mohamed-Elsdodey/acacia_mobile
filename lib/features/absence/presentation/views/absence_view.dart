import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/absence_repo_impl.dart';
import '../manager/absence/absence_cubit.dart';
import '../widgets/absence_view_body.dart';

class AbsenceView extends StatefulWidget {
  const AbsenceView({super.key});

  @override
  State<AbsenceView> createState() => _AbsenceViewState();
}

class _AbsenceViewState extends State<AbsenceView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AbsenceCubit(
        getIt.get<AbsenceRepoImpl>(),
      )..getAbsence(month: DateFormat('yyyy-MM', 'en').format(DateTime.now())),
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
            S.of(context).absences,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: const AbsenceViewBody(),
      ),
    );
  }
}
