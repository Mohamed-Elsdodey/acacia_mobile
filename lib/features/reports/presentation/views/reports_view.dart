import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/reports_repo_impl.dart';
import '../manager/reports/reports_cubit.dart';
import '../widgets/reports_view_body.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportsCubit(
        getIt.get<ReportsRepoImpl>(),
      )..getReports(month: DateFormat('yyyy-MM', 'en').format(DateTime.now())),
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
            S.of(context).reports,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const ReportsViewBody(),
      ),
    );
  }
}
