import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../features/login/presentation/views/login_view.dart';
import '../../generated/l10n.dart';
import '../helper/AlertDialog/custom_alert_dialog.dart';
import '../helper/SharedPreferences/pref.dart';
import '../widgets/custom_loading_widget.dart';
import 'api_service.dart';
import 'app_strings.dart';
import 'go_to.dart';

Expanded invalidToken(BuildContext context) {
  Future.delayed(Duration.zero, () {
    if (context.mounted) {
      CustomAlertDialog.alertWithButton(
          context: context,
          type: AlertType.error,
          title: S.of(context).warning,
          desc: S.of(context).warning_massge,
          isCloseButton: false,
          isOverlayTapDismiss: false,
          onPressed: () {
            GoTo.pushAndRemoveUntil(context, const LoginView());
          });
    }
  });

  return const Expanded(child: CustomLoadingWidget());
}

void logoutNotifications({required String tokenFirebase}) async {
  try {
    String schoolDomain =
        await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
    String token =
        await Pref.getStringFromPref(key: AppStrings.parantTokenKey) ?? "";
    String type = "";
    if (Platform.isAndroid) {
      type = "android";
    } else if (Platform.isIOS) {
      type = "ios";
    }
    await ApiService(Dio()).post(
      host: schoolDomain,
      endPoint: "parent/auth/logout",
      data: FormData.fromMap({
        "type": type,
        "token": tokenFirebase,
      }),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

void upDateTokenNotifications(
    {required String tokenLogin, required String tokenFirebase}) async {
  try {
    String schoolDomain =
        await Pref.getStringFromPref(key: AppStrings.schoolDomainKey) ?? "";
    String type = "";
    if (Platform.isAndroid) {
      type = "android";
    } else if (Platform.isIOS) {
      type = "ios";
    }
    await ApiService(Dio()).post(
      host: schoolDomain,
      endPoint: "parent/auth/update_token?type=$type&token=$tokenFirebase",
      data: null,
      headers: {
        "Authorization": "Bearer $tokenLogin",
      },
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}
