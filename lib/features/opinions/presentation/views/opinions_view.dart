import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/go_to.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/opinions_repo_impl.dart';
import '../manager/opinions/opinions_cubit.dart';
import '../widgets/opinions_view_body.dart';

class OpinionsView extends StatefulWidget {
  const OpinionsView({super.key});

  @override
  State<OpinionsView> createState() => _OpinionsViewState();
}

class _OpinionsViewState extends State<OpinionsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OpinionsCubit(
        getIt.get<OpinionsRepoImpl>(),
      )..getOpinions(),
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
            S.of(context).opinions,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: const OpinionsViewBody(),
      ),
    );
  }
}
