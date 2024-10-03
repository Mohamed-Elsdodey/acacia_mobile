// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تحديد المدرسة`
  String get choose_school {
    return Intl.message(
      'تحديد المدرسة',
      name: 'choose_school',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك أدخل كود المدرسة!❤`
  String get p_choose_school {
    return Intl.message(
      'من فضلك أدخل كود المدرسة!❤',
      name: 'p_choose_school',
      desc: '',
      args: [],
    );
  }

  /// `كود المدرسة`
  String get school_code {
    return Intl.message(
      'كود المدرسة',
      name: 'school_code',
      desc: '',
      args: [],
    );
  }

  /// `متابعة`
  String get next {
    return Intl.message(
      'متابعة',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get login {
    return Intl.message(
      'تسجيل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `أهلا بكم فى مدرسة `
  String get welcome {
    return Intl.message(
      'أهلا بكم فى مدرسة ',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `حدد مدرسة أخرى`
  String get choose_anther_school {
    return Intl.message(
      'حدد مدرسة أخرى',
      name: 'choose_anther_school',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get field_is_required {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `حسناً`
  String get ok {
    return Intl.message(
      'حسناً',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `خطأ`
  String get error {
    return Intl.message(
      'خطأ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `الرئيسية`
  String get home {
    return Intl.message(
      'الرئيسية',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `التحفيز`
  String get motivation {
    return Intl.message(
      'التحفيز',
      name: 'motivation',
      desc: '',
      args: [],
    );
  }

  /// `الأبناء`
  String get childern {
    return Intl.message(
      'الأبناء',
      name: 'childern',
      desc: '',
      args: [],
    );
  }

  /// `الحصص`
  String get classes {
    return Intl.message(
      'الحصص',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get more {
    return Intl.message(
      'المزيد',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `الاختبارات`
  String get exams {
    return Intl.message(
      'الاختبارات',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `التقارير`
  String get reports {
    return Intl.message(
      'التقارير',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `الغياب والتأخير`
  String get absences {
    return Intl.message(
      'الغياب والتأخير',
      name: 'absences',
      desc: '',
      args: [],
    );
  }

  /// `بيانات الحساب`
  String get data_acount {
    return Intl.message(
      'بيانات الحساب',
      name: 'data_acount',
      desc: '',
      args: [],
    );
  }

  /// `حول التطبيق`
  String get about_app {
    return Intl.message(
      'حول التطبيق',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get logout {
    return Intl.message(
      'تسجيل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد أبناء`
  String get no_childern {
    return Intl.message(
      'لا يوجد أبناء',
      name: 'no_childern',
      desc: '',
      args: [],
    );
  }

  /// `رقم الصف: `
  String get row {
    return Intl.message(
      'رقم الصف: ',
      name: 'row',
      desc: '',
      args: [],
    );
  }

  /// `رقم الفصل: `
  String get room {
    return Intl.message(
      'رقم الفصل: ',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `الترتيب على المدرسة: `
  String get rank_school {
    return Intl.message(
      'الترتيب على المدرسة: ',
      name: 'rank_school',
      desc: '',
      args: [],
    );
  }

  /// `الترتيب على الصف: `
  String get rank_row {
    return Intl.message(
      'الترتيب على الصف: ',
      name: 'rank_row',
      desc: '',
      args: [],
    );
  }

  /// `الترتيب على الفصل: `
  String get rank_room {
    return Intl.message(
      'الترتيب على الفصل: ',
      name: 'rank_room',
      desc: '',
      args: [],
    );
  }

  /// `عفواً`
  String get warning {
    return Intl.message(
      'عفواً',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `لقد انتهت صلاحية الجلسة برجاء تسجيل الدخول مرة أخرى.`
  String get warning_massge {
    return Intl.message(
      'لقد انتهت صلاحية الجلسة برجاء تسجيل الدخول مرة أخرى.',
      name: 'warning_massge',
      desc: '',
      args: [],
    );
  }

  /// `حالة الطالب: `
  String get st_info {
    return Intl.message(
      'حالة الطالب: ',
      name: 'st_info',
      desc: '',
      args: [],
    );
  }

  /// `النقاط: `
  String get points {
    return Intl.message(
      'النقاط: ',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `الرصيد الإجمالي: `
  String get total_point {
    return Intl.message(
      'الرصيد الإجمالي: ',
      name: 'total_point',
      desc: '',
      args: [],
    );
  }

  /// `المادة الدراسية: `
  String get subject {
    return Intl.message(
      'المادة الدراسية: ',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `اسم المدرس: `
  String get sub_teacher {
    return Intl.message(
      'اسم المدرس: ',
      name: 'sub_teacher',
      desc: '',
      args: [],
    );
  }

  /// `الدرجة الكلية: `
  String get total_degree {
    return Intl.message(
      'الدرجة الكلية: ',
      name: 'total_degree',
      desc: '',
      args: [],
    );
  }

  /// `درجة الطالب: `
  String get st_degree {
    return Intl.message(
      'درجة الطالب: ',
      name: 'st_degree',
      desc: '',
      args: [],
    );
  }

  /// `اسم مدرس المادة: `
  String get teacher {
    return Intl.message(
      'اسم مدرس المادة: ',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `التاريخ: `
  String get date {
    return Intl.message(
      'التاريخ: ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `رصيد التميزات أصبح: `
  String get total_positive {
    return Intl.message(
      'رصيد التميزات أصبح: ',
      name: 'total_positive',
      desc: '',
      args: [],
    );
  }

  /// `رصيد العقوبات أصبح: `
  String get total_nagative {
    return Intl.message(
      'رصيد العقوبات أصبح: ',
      name: 'total_nagative',
      desc: '',
      args: [],
    );
  }

  /// `تميز`
  String get positive {
    return Intl.message(
      'تميز',
      name: 'positive',
      desc: '',
      args: [],
    );
  }

  /// `عقوبة`
  String get nagative {
    return Intl.message(
      'عقوبة',
      name: 'nagative',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد بالفعل تسجيل الخروج؟`
  String get logout_massge {
    return Intl.message(
      'هل تريد بالفعل تسجيل الخروج؟',
      name: 'logout_massge',
      desc: '',
      args: [],
    );
  }

  /// `لا`
  String get no {
    return Intl.message(
      'لا',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد تحفيز`
  String get no_reviews {
    return Intl.message(
      'لا يوجد تحفيز',
      name: 'no_reviews',
      desc: '',
      args: [],
    );
  }

  /// `برجاء ادخال بريدإلكتروني صحيح`
  String get invalid_email {
    return Intl.message(
      'برجاء ادخال بريدإلكتروني صحيح',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `البريدالإلكتروني غير صحيح`
  String get no_email {
    return Intl.message(
      'البريدالإلكتروني غير صحيح',
      name: 'no_email',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير صحيحة`
  String get no_password {
    return Intl.message(
      'كلمة المرور غير صحيحة',
      name: 'no_password',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد إختبارات`
  String get no_exams {
    return Intl.message(
      'لا يوجد إختبارات',
      name: 'no_exams',
      desc: '',
      args: [],
    );
  }

  /// `الإشعارات`
  String get notifications {
    return Intl.message(
      'الإشعارات',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد الإشعارات`
  String get no_notifications {
    return Intl.message(
      'لا يوجد الإشعارات',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get name {
    return Intl.message(
      'الاسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `كلمة السر الجديدة`
  String get new_password {
    return Intl.message(
      'كلمة السر الجديدة',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة السر`
  String get confirm_password {
    return Intl.message(
      'تأكيد كلمة السر',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `حفظ التعديلات`
  String get save_changes {
    return Intl.message(
      'حفظ التعديلات',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة السر غير مطابقة`
  String get invalid_password {
    return Intl.message(
      'تأكيد كلمة السر غير مطابقة',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `تم تحديث البيانات بنجاح`
  String get updated_successfully {
    return Intl.message(
      'تم تحديث البيانات بنجاح',
      name: 'updated_successfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
