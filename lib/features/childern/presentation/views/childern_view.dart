import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
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
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 25),
              child: InkWell(
                  onTap: () {
                    // push(NotificationScreen(
                    //     parentId:
                    //     data.getChildId().isNotEmpty ? data.getChildId() : ''));
                  },
                  child: Image.asset(
                    AppAssets.notification,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        body: const ChildernViewBody(),
      ),
    );
  }
}
