import 'dart:io';

import 'package:evaluation_and_follow_up/core/utils/my_http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/helper/SharedPreferences/pref.dart';
import 'core/manager/color_provider.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setupServiceLocator();

  runApp(ChangeNotifierProvider(
      create: (context) => ColorProvider()..loadColor(),
      child: const EvaluationAndFollowUp()));
}

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

  // تحويل لون إلى `MaterialColor`
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
