import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../manager/login/login_cubit.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<LoginRepoImpl>(),
      ),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: LoginViewBody(),
      ),
    );
  }
}
