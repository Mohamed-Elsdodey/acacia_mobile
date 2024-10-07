import 'dart:io';

import 'package:evaluation_and_follow_up/core/utils/my_http_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'core/helper/AlertDialog/custom_alert_dialog.dart';
import 'core/helper/SharedPreferences/pref.dart';
import 'core/manager/color_provider.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setupServiceLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ChangeNotifierProvider(
      create: (context) => ColorProvider()..loadColor(),
      child: const EvaluationAndFollowUp()));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class EvaluationAndFollowUp extends StatefulWidget {
  const EvaluationAndFollowUp({super.key});

  static void setLocale(BuildContext context, Locale locale) {
    _EvaluationAndFollowUpState? state =
        context.findAncestorStateOfType<_EvaluationAndFollowUpState>();
    state?.setLocale(locale);
  }

  @override
  State<EvaluationAndFollowUp> createState() => _EvaluationAndFollowUpState();
}

class _EvaluationAndFollowUpState extends State<EvaluationAndFollowUp> {
  Locale _locale = const Locale(AppStrings.arLangKey);
  Color primaryColor = const Color(0xff4EA74F);

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          CustomAlertDialog.alertWithButton(
              context: context,
              type: AlertType.info,
              title: message.notification?.title ?? S.of(context).no_title,
              desc: message.notification?.body ?? S.of(context).no_dec);
        },
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    checkForInitialMessage();
  }

  Future<void> checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {}
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider, child) {
        return MaterialApp(
          title: AppStrings.appTitleKey,
          theme: ThemeData(
            fontFamily: 'Sukar',
            primaryColor: colorProvider.currentColor,
            scaffoldBackgroundColor: const Color(0XFFFFFFFF),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const SplashView(),
        );
      },
    );
  }

  Future<void> getLocale() async {
    String language = await Pref.getStringFromPref(key: AppStrings.langKey) ??
        AppStrings.arLangKey;
    setState(() {
      _locale = Locale(language);
    });
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}
