import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';

import '../../data/repositories/home_work_repo_impl.dart';
import '../manager/HomeWork/home_work_cubit.dart';
import '../widgets/home_work_view_body.dart';

class HomeWorkView extends StatefulWidget {
  const HomeWorkView({super.key});

  @override
  State<HomeWorkView> createState() => _HomeWorkViewState();
}

class _HomeWorkViewState extends State<HomeWorkView> {

  @override
  Widget build(BuildContext context) {

    return
      BlocProvider(
          create: (context) => HomeWorkCubit(
            getIt.get<HomeWorkRepoImpl>(),
          ),
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
                S.of(context).home_work,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
            ),
            body: const HomeWorkViewBody(),
          )
      );

  }
}
