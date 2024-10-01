import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';
import '../../../../core/widgets/custom_error_massage.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/reviews_model.dart';
import '../manager/reviews/reviews_cubit.dart';
import 'reviews_list_item.dart';

class ReviewsViewBody extends StatefulWidget {
  const ReviewsViewBody({super.key});

  @override
  State<ReviewsViewBody> createState() => _ReviewsViewBodyState();
}

class _ReviewsViewBodyState extends State<ReviewsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<ReviewsCubit, ReviewsState>(
        builder: (context, state) {
          if (state is ReviewsSuccess) {
            if (state.reviewsModel.status == 401) {
              return invalidToken(context);
            } else {
              List<ReviewItem>? listReviews = state.reviewsModel.data;
              if (listReviews != null) {
                return ListView.separated(
                  itemBuilder: (context, index) => ReviewsListItem(
                    reviewItem: listReviews[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: listReviews.length,
                );
              } else {
                return Expanded(
                    child: Center(child: Text(S.of(context).no_childern)));
              }
            }
          } else if (state is ReviewsFailure) {
            return CustomErrorMassage(errorMassage: state.errorMassage);
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
