import 'package:evaluation_and_follow_up/features/opinions/data/models/opinions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_refresh_page.dart';
import '../../../../generated/l10n.dart';
import '../manager/opinions/opinions_cubit.dart';

class OpinionsViewBody extends StatefulWidget {
  const OpinionsViewBody({super.key});

  @override
  State<OpinionsViewBody> createState() => _OpinionsViewBodyState();
}

class _OpinionsViewBodyState extends State<OpinionsViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<OpinionsCubit>(context).getOpinions();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<OpinionsCubit, OpinionsState>(
            builder: (context, state) {
              if (state is OpinionsSuccess) {
                if (state.opinionsModel.status == 401) {
                  return invalidToken(context);
                } else if (state.opinionsModel.status == 403) {
                  return Center(child: Text(state.opinionsModel.message![0]));
                } else {
                  List<OpinionData> listOpinions = state.opinionsModel.data!;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        end: BorderSide(
                                  color: Colors.grey.shade400,
                                ))),
                                child: Text(
                                  S.of(context).sub_opinion,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 48,
                                  child: Text(
                                    S.of(context).opinions,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                          listOpinions.length,
                          (index) {
                            OpinionData data = listOpinions[index];
                            return Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: index.isOdd
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.1),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 48,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    decoration: BoxDecoration(
                                        border: BorderDirectional(
                                            end: BorderSide(
                                      color: Colors.grey.shade400,
                                    ))),
                                    child: Text(
                                      data.title!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    data.studentPerformanceEvaluation!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                }
              } else if (state is OpinionsFailure) {
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
