import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/data_account_repo_impl.dart';
import '../manager/dataAccount/data_account_cubit.dart';
import '../widgets/data_account_view_body.dart';

class DataAccountView extends StatefulWidget {
  const DataAccountView({super.key});

  @override
  State<DataAccountView> createState() => _DataAccountViewState();
}

class _DataAccountViewState extends State<DataAccountView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataAccountCubit(
        getIt.get<DataAccountRepoImpl>(),
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
            S.of(context).data_acount,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const DataAccountViewBody(),
      ),
    );
  }
}
