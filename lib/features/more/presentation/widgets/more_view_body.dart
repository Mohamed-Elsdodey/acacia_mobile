import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:evaluation_and_follow_up/features/HomeWork/presentation/views/home_work_view.dart';
import 'package:evaluation_and_follow_up/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/helper/SharedPreferences/pref.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/methods.dart';
import '../../../../generated/l10n.dart';
import '../../../absence/presentation/views/absence_view.dart';
import '../../../dataAccount/presentation/views/data_account_view.dart';
import '../../../exams/presentation/views/exams_view.dart';
import '../../../login/presentation/views/login_view.dart';
import '../../../messages/presentation/views/messages_view.dart';
import '../../../notifications/presentation/views/notifications_view.dart';
import '../../../opinions/presentation/views/opinions_view.dart';
import '../../../reports/presentation/views/reports_view.dart';
import '../../../summary/presentation/views/summary_view.dart';
import '../../../weeklyMessage/presentation/views/weekly_message_view.dart';
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
      MoreItemModel(title: S.of(context).summary, imagePath: AppAssets.frame1),
      MoreItemModel(title: S.of(context).opinions, imagePath: AppAssets.frame2),
      MoreItemModel(
          title: S.of(context).weekly_message, imagePath: AppAssets.frame4),
      MoreItemModel(title: S.of(context).messages, imagePath: AppAssets.massge),
      MoreItemModel(
          title: S.of(context).home_work, imagePath: AppAssets.frame2),
      MoreItemModel(title: S.of(context).settings, imagePath: AppAssets.frame7),
      MoreItemModel(title: S.of(context).logout, imagePath: AppAssets.frame6),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            S.of(context).more,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            InkWell(
              onTap: () {
                GoTo.push(context, const NotificationsView());
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
            crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5 / 3,
            padding: const EdgeInsets.all(10),
            children: List.generate(moreList.length, (index) {
              return InkWell(
                onTap: () async {
                  switch (index) {
                    case 0:
                      GoTo.push(context, const ExamsView());
                      break;
                    case 1:
                      GoTo.push(context, const ReportsView());

                      break;
                    case 2:
                      GoTo.push(context, const AbsenceView());

                      break;
                    case 3:
                      GoTo.push(context, const DataAccountView());

                      break;
                    case 4:
                      GoTo.push(context, const SummaryView());
                      break;
                    case 5:
                      GoTo.push(context, const OpinionsView());
                      break;
                    case 6:
                      GoTo.push(context, const WeeklyMessageView());
                      break;
                    case 7:
                      GoTo.push(context, const MessagesView());
                      break;
                    case 8:
                      GoTo.push(context, const HomeWorkView());
                      break;
                    case 9:
                      GoTo.push(context, const SettingsView());
                      break;
                    case 10:
                      String firebaseToken = await getTokenFirebase();
                      if (context.mounted) {
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
                              logoutNotifications(
                                tokenFirebase: firebaseToken,
                              );
                              GoTo.pushAndRemoveUntil(
                                  context, const LoginView());
                            });
                      }
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
                        // color:
                        //     index == 8 ? Theme.of(context).primaryColor : null,
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

  Future<String> getTokenFirebase() async {
    String token =
        await Pref.getStringFromPref(key: AppStrings.firebaseTokenKey) ?? "";
    return token;
  }
}
