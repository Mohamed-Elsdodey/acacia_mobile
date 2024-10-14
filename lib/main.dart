import 'dart:io';

import 'package:evaluation_and_follow_up/core/utils/my_http_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/helper/SharedPreferences/pref.dart';
import 'core/manager/color_provider.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart';
import 'features/notifications/presentation/views/notifications_view.dart';
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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("\n\n\n\n\n\n===========================================\n\n\n\n");
      _showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("\n\n\n\n\n\n*************************************\n\n\n\n");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationsView(studentId: 1),
        ),
      );
    });
    checkForInitialMessage();
  }

  Future<void> _showNotification(RemoteMessage message) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
    );
  }

  Future<void> checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("\n\n\n\n\n\n////////////////////////////////////\n\n\n\n");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationsView(studentId: 1),
        ),
      );
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await getLocale();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) {
        return Consumer<ColorProvider>(
          builder: (context, colorProvider, child) {
            return MaterialApp(
              title: AppStrings.appTitleKey,
              theme: ThemeData(
                fontFamily: 'Sukar',
                primaryColor: colorProvider.currentColor,
                scaffoldBackgroundColor: const Color(0XFFFFFFFF),
                useMaterial3: true,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: colorProvider.currentColor,
                  selectionColor: colorProvider.currentColor.withOpacity(0.5),
                  selectionHandleColor: colorProvider.currentColor,
                ),
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
