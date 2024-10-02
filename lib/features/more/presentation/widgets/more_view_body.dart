import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../generated/l10n.dart';
import '../../../exams/presentation/views/exams_view.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../data/models/more_item_model.dart';

class MoreViewBody extends StatefulWidget {
  const MoreViewBody({super.key});

  @override
  State<MoreViewBody> createState() => _MoreViewBodyState();
}

class _MoreViewBodyState extends State<MoreViewBody> {
  late List<MoreItemModel> moreList;

  @override
  Widget build(BuildContext context) {
    moreList = [
      MoreItemModel(title: S.of(context).exams, imagePath: AppAssets.frame1),
      MoreItemModel(title: S.of(context).reports, imagePath: AppAssets.frame2),
      MoreItemModel(title: S.of(context).absences, imagePath: AppAssets.frame3),
      MoreItemModel(
          title: S.of(context).data_acount, imagePath: AppAssets.frame4),
      MoreItemModel(
          title: S.of(context).about_app, imagePath: AppAssets.frame5),
      MoreItemModel(title: S.of(context).logout, imagePath: AppAssets.frame6),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            S.of(context).more,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                // push(NotificationScreen(
                //   parentId: widget.studentId ?? '',
                // ));
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 24),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      AppAssets.notification,
                      color: Colors.white,
                    ),
                    const PositionedDirectional(
                      top: -2,
                      start: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          // backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2, // عدد الأعمدة
            crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
            mainAxisSpacing: 10, // المسافة الرأسية بين العناصر
            childAspectRatio: 5 / 3,
            padding: const EdgeInsets.all(10),
            children: List.generate(moreList.length, (index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      GoTo.push(context, const ExamsView());
                      break;
                    case 1:
                      // push(StudentDataScreen(
                      //     studentId: saveData.getChildId().isNotEmpty
                      //         ? saveData.getChildId()
                      //         : ''));

                      break;
                    case 2:
                      // push(AbsencesTab(
                      //     studentId: saveData.getChildId().isNotEmpty
                      //         ? saveData.getChildId()
                      //         : ''));

                      break;
                    case 3:
                      // push(UpdateProfile(
                      //     parentId:
                      //         saveData.getUserData()?.data?.id.toString() ?? ''));

                      break;
                    case 4:
                      break;
                    case 5:
                      // createAlertDialogLogout();
                      CustomAlertDialog.alertWithTwoButton(
                          context: context,
                          type: AlertType.warning,
                          title: S.of(context).logout,
                          desc: S.of(context).logout_massge,
                          isCloseButton: false,
                          isOverlayTapDismiss: false,
                          textButton1: S.of(context).no,
                          textButton2: S.of(context).ok,
                          onPressedToButton1: () {
                            GoTo.pop(context);
                          },
                          onPressedToButton2: () {
                            Pref.saveBoolToPref(
                                key: AppStrings.isLoginKey, value: false);
                            Pref.removeKey(key: AppStrings.parantTokenKey);
                            Pref.removeKey(key: AppStrings.parantPhoneKey);
                            Pref.removeKey(key: AppStrings.parantEmailKey);
                            Pref.removeKey(key: AppStrings.parantIdKey);
                            Pref.removeKey(key: AppStrings.childernIdKey);

                            GoTo.pushReplacement(context, const LoginView());
                          });
                      break;
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDEDED),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffDDDDDD),
                          offset: Offset(0, 0),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        moreList[index].imagePath,
                        width: 36,
                        height: 36,
                        color:
                            index == 4 ? Theme.of(context).primaryColor : null,
                      ),
                      Text(
                        moreList[index].title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
