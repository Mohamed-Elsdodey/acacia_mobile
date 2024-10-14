import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/childern/presentation/widgets/childern_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/childern_model.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../manager/childern/childern_cubit.dart';

class ChildernViewBody extends StatefulWidget {
  const ChildernViewBody({super.key});

  @override
  State<ChildernViewBody> createState() => _ChildernViewBodyState();
}

class _ChildernViewBodyState extends State<ChildernViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<ChildernCubit>(context).getChildern();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: BlocBuilder<ChildernCubit, ChildernState>(
            builder: (context, state) {
              if (state is ChildernSuccess) {
                List<DataChildern>? listChildern = state.childernModel.data;
                if (listChildern!.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      ...List.generate(
                        listChildern.length,
                        (index) => ChildernListItem(
                          childernInfo: listChildern[index],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.r),
                    child: Center(child: Text(S.of(context).no_childern)),
                  );
                }
              } else if (state is ChildernFailure) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: CustomErrorMassage(errorMassage: state.errorMassage),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.r),
                  child: const CustomLoadingWidget(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
