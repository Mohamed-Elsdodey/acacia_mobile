import 'package:evaluation_and_follow_up/core/helper/SharedPreferences/pref.dart';
import 'package:evaluation_and_follow_up/core/utils/app_strings.dart';
import 'package:evaluation_and_follow_up/core/utils/go_to.dart';
import 'package:evaluation_and_follow_up/features/notifications/presentation/views/notifications_view.dart';
import 'package:evaluation_and_follow_up/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../generated/l10n.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  Widget build(BuildContext context) {
    String _selectedLanguage = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          S.of(context).settings,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              S.of(context).language,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            ListTile(
              title: Text("English"),
              leading: Radio<String>(
                  value: 'en',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    Pref.saveStringToPref(
                        key: AppStrings.langKey, value: value!);
                    setState(() {
                      _selectedLanguage = value;
                      EvaluationAndFollowUp.setLocale(
                          context, Locale(_selectedLanguage));
                    });
                  }),
            ),
            ListTile(
              title: Text("عربي"),
              leading: Radio<String>(
                  value: 'ar',
                  groupValue: _selectedLanguage,
                  onChanged: (value) {
                    Pref.saveStringToPref(
                        key: AppStrings.langKey, value: value!);
                    setState(() {
                      _selectedLanguage = value;
                      EvaluationAndFollowUp.setLocale(
                          context, Locale(_selectedLanguage));
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
