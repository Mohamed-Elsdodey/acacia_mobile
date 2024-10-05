import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/summary/presentation/manager/summary/summary_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/summary_model.dart';
import 'custom_summary_data.dart';

class SummaryViewBody extends StatefulWidget {
  const SummaryViewBody({super.key});

  @override
  State<SummaryViewBody> createState() => _SummaryViewBodyState();
}

class _SummaryViewBodyState extends State<SummaryViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<SummaryCubit>(context).getSummary();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<SummaryCubit, SummaryState>(
            builder: (context, state) {
              if (state is SummarySuccess) {
                if (state.summaryModel.status == 401) {
                  return invalidToken(context);
                } else if (state.summaryModel.status == 403) {
                  return Column(
                    children: [
                      Center(child: Text(S.of(context).no_summary)),
                    ],
                  );
                } else {
                  SummaryData? summaryData = state.summaryModel.data;
                  if (summaryData != null) {
                    return CustomSummaryData(
                      summaryData: summaryData,
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Center(child: Text(S.of(context).no_summary)),
                    );
                  }
                }
              } else if (state is SummaryFailure) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: CustomErrorMassage(errorMassage: state.errorMassage),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: CustomLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
