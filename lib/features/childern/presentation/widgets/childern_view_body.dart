import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/childern_model.dart';
import '../../../../core/widgets/childern_info.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<ChildernCubit, ChildernState>(
        builder: (context, state) {
          if (state is ChildernSuccess) {
            List<DataChildern>? listChildern = state.childernModel.data;
            if (listChildern != null) {
              return ListView.separated(
                itemBuilder: (context, index) => ChildernInfo(
                  childernInfo: listChildern[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: listChildern.length,
              );
            } else {
              return Expanded(
                  child: Center(child: Text(S.of(context).no_childern)));
            }
          } else if (state is ChildernFailure) {
            return CustomErrorMassage(errorMassage: state.errorMassage);
          } else {
            return const Expanded(child: CustomLoadingWidget());
          }
        },
      ),
    );
  }
}