import 'package:evaluation_and_follow_up/features/exams/presentation/widgets/exams_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_refresh_page.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/exams_model.dart';
import '../manager/exams/exams_cubit.dart';

class ExamsViewBody extends StatefulWidget {
  const ExamsViewBody({super.key});

  @override
  State<ExamsViewBody> createState() => _ExamsViewBodyState();
}

class _ExamsViewBodyState extends State<ExamsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<ExamsCubit, ExamsState>(
        builder: (context, state) {
          if (state is ExamsSuccess) {
            if (state.examsModel.status == 401) {
              return invalidToken(context);
            } else if (state.examsModel.status == 403) {
              return Column(
                children: [
                  Center(child: Text(S.of(context).no_exams)),
                ],
              );
            } else {
              List<ExamItem>? listExams = state.examsModel.data;

              return CustomRefreshPage(
                onRefresh: () async {
                  await BlocProvider.of<ExamsCubit>(context).getExams();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (listExams!.isNotEmpty)
                        GridView.builder(
                          itemBuilder: (context, index) {
                            return ExamsListItem(examItem: listExams[index]);
                          },
                          itemCount: listExams.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).size.width ~/ 150,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 0.75),
                        ),
                      if (listExams.isEmpty)
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100),
                            child: Center(child: Text(S.of(context).no_exams)),
                          ),
                        )
                    ],
                  ),
                ),
              );
            }
          } else if (state is ExamsFailure) {
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
    );
  }
}
