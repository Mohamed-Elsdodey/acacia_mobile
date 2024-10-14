import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return CustomRefreshPage(
      onRefresh: () async {
        await BlocProvider.of<ReviewsCubit>(context).getReviews();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: BlocBuilder<ReviewsCubit, ReviewsState>(
            builder: (context, state) {
              if (state is ReviewsSuccess) {
                if (state.reviewsModel.status == 401) {
                  return invalidToken(context);
                } else if (state.reviewsModel.status == 403) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 100.r),
                    child: Center(child: Text(S.of(context).no_reviews)),
                  );
                } else {
                  List<ReviewItem>? listReviews = state.reviewsModel.data;

                  if (listReviews!.isNotEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        ...List.generate(
                          listReviews.length,
                          (index) => ReviewsListItem(
                            reviewItem: listReviews[index],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.r),
                      child: Center(child: Text(S.of(context).no_reviews)),
                    );
                  }
                }
              } else if (state is ReviewsFailure) {
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
