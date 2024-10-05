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
              return Center(child: Text(S.of(context).no_exams));
            } else {
              List<ExamItem>? listExams = state.examsModel.data;

              if (listExams!.isNotEmpty) {
                return CustomRefreshPage(
                  onRefresh: () async {
                    await BlocProvider.of<ExamsCubit>(context).getExams();
                  },
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 4.3 / 5,
                    // padding: const EdgeInsets.all(10),
                    children: List.generate(listExams.length, (index) {
                      return ExamsListItem(examItem: listExams[index]);
                    }),
                  ),
                );
              } else {
                return Center(child: Text(S.of(context).no_exams));
              }
            }
          } else if (state is ExamsFailure) {
            return CustomErrorMassage(errorMassage: state.errorMassage);
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
