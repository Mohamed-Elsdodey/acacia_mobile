import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../bottomNavigationBar/presentation/views/bottom_navigatiaon_bar_view.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../../schoolCode/presentation/views/school_code_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    super.initState();
    initSlidAnimation();
    navigateToNewView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      alignment: Alignment.center,
      child: AnimatedBuilder(
          animation: sliderAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: sliderAnimation,
              child: Image.asset(
                AppAssets.splashLoge,
                height: 200,
                width: 200,
              ),
            );
          }),
    );
  }

  void navigateToNewView() {
    Future.delayed(
      const Duration(seconds: 5),
      () async {
        String schoolDomain =
            await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
        bool isLogin =
            await Pref.getBoolFromPref(key: AppStrings.isLoginKey) ?? false;
        if (isLogin == true && schoolDomain.isNotEmpty) {
          if (mounted) {
            //go to home
            GoTo.pushAndRemoveUntil(context, const BottomNavigationBarView());
          }
        } else if (isLogin == false && schoolDomain.isNotEmpty) {
          if (mounted) {
            //go to login
            GoTo.pushAndRemoveUntil(context, const LoginView());
          }
        } else if (isLogin == false && schoolDomain.isEmpty) {
          if (mounted) {
            //go to school code
            GoTo.pushAndRemoveUntil(context, const SchoolCodeView());
          }
        }
      },
    );
  }

  void initSlidAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    sliderAnimation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }
}
