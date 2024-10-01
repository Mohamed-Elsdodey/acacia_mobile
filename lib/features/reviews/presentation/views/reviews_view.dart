import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../data/repositories/reviews_repo_impl.dart';
import '../manager/reviews/reviews_cubit.dart';
import '../widgets/reviews_view_body.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  String? lang;

  @override
  void didChangeDependencies() {
    lang = Localizations.localeOf(context).toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(
        getIt.get<ReviewsRepoImpl>(),
      )..getReviews(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            S.of(context).motivation,
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
        body: const ReviewsViewBody(),
      ),
    );
  }
}
