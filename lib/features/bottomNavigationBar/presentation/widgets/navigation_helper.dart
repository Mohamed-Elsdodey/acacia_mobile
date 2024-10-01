import 'package:evaluation_and_follow_up/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../../childern/presentation/views/childern_view.dart';
import '../../../more/presentation/views/more_view.dart';
import '../../../reviews/presentation/views/reviews_view.dart';

class NavigationHelper {
  static Widget getMyWidget(int index) {
    switch (index) {
      case 1:
        return const HomeView();
      case 2:
        return const ReviewsView();
      case 3:
        return const ChildernView();
      case 4:
        return const Scaffold(
          body: Center(
            child: Text("4"),
          ),
        );
      default:
        return const MoreView();
    }
  }
}
