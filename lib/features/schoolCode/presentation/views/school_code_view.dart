import 'package:evaluation_and_follow_up/features/schoolCode/data/repositories/school_code_repo_impl.dart';
import 'package:evaluation_and_follow_up/features/schoolCode/presentation/manager/schoolCode/school_code_cubit.dart';
import 'package:evaluation_and_follow_up/features/schoolCode/presentation/widgets/school_code_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';

class SchoolCodeView extends StatelessWidget {
  const SchoolCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SchoolCodeCubit(
        getIt.get<SchoolCodeRepoImpl>(),
      ),
      child: const Scaffold(
        body: SchoolCodeViewBody(),
      ),
    );
  }
}
