import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/exams_repo_impl.dart';
import '../manager/exams/exams_cubit.dart';
import '../widgets/exams_view_body.dart';

class ExamsView extends StatefulWidget {
  const ExamsView({super.key});

  @override
  State<ExamsView> createState() => _ExamsViewState();
}

class _ExamsViewState extends State<ExamsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit(
        getIt.get<ExamsRepoImpl>(),
      )..getExams(),
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
            S.of(context).exams,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const ExamsViewBody(),
      ),
    );
  }
}
