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

  /// `لا يوجد غيابات أو تأخير`
  String get no_absence {
    return Intl.message(
      'لا يوجد غيابات أو تأخير',
      name: 'no_absence',
      desc: '',
      args: [],
    );
  }

  /// `حالة الطالب: `
  String get student_type {
    return Intl.message(
      'حالة الطالب: ',
      name: 'student_type',
      desc: '',
      args: [],
    );
  }

  /// `تأخير`
  String get delay {
    return Intl.message(
      'تأخير',
      name: 'delay',
      desc: '',
      args: [],
    );
  }

  /// `غياب`
  String get absence {
    return Intl.message(
      'غياب',
      name: 'absence',
      desc: '',
      args: [],
    );
  }

  /// `عدد أيام التأخير: `
  String get day_delay {
    return Intl.message(
      'عدد أيام التأخير: ',
      name: 'day_delay',
      desc: '',
      args: [],
    );
  }

  /// `عدد أيام الغياب: `
  String get day_absence {
    return Intl.message(
      'عدد أيام الغياب: ',
      name: 'day_absence',
      desc: '',
      args: [],
    );
  }

  /// `إجمالي الغياب: `
  String get total_absence {
    return Intl.message(
      'إجمالي الغياب: ',
      name: 'total_absence',
      desc: '',
      args: [],
    );
  }

  /// `إجمالي التأخير: `
  String get total_delay {
    return Intl.message(
      'إجمالي التأخير: ',
      name: 'total_delay',
      desc: '',
      args: [],
    );
  }

  /// `الموجز`
  String get summary {
    return Intl.message(
      'الموجز',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `الكل`
  String get all {
    return Intl.message(
      'الكل',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `سلوكي`
  String get behavior {
    return Intl.message(
      'سلوكي',
      name: 'behavior',
      desc: '',
      args: [],
    );
  }

  /// `أكاديمي`
  String get academic {
    return Intl.message(
      'أكاديمي',
      name: 'academic',
      desc: '',
      args: [],
    );
  }

  /// `الحصص اليومية`
  String get schedules {
    return Intl.message(
      'الحصص اليومية',
      name: 'schedules',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد جدول حصص`
  String get no_schedules {
    return Intl.message(
      'لا يوجد جدول حصص',
      name: 'no_schedules',
      desc: '',
      args: [],
    );
  }

  /// `اليوم`
  String get day {
    return Intl.message(
      'اليوم',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد مدرسة بهذا الكود`
  String get no_school_code {
    return Intl.message(
      'لا يوجد مدرسة بهذا الكود',
      name: 'no_school_code',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد موجز`
  String get no_summary {
    return Intl.message(
      'لا يوجد موجز',
      name: 'no_summary',
      desc: '',
      args: [],
    );
  }

  /// `ادائك `
  String get summary_title1 {
    return Intl.message(
      'ادائك ',
      name: 'summary_title1',
      desc: '',
      args: [],
    );
  }

  /// ` هذا الشهر .. استمر في التحسن`
  String get summary_title2 {
    return Intl.message(
      ' هذا الشهر .. استمر في التحسن',
      name: 'summary_title2',
      desc: '',
      args: [],
    );
  }

  /// `اسم المادة`
  String get summary_subject_name {
    return Intl.message(
      'اسم المادة',
      name: 'summary_subject_name',
      desc: '',
      args: [],
    );
  }

  /// `الدرجة`
  String get summary_degree {
    return Intl.message(
      'الدرجة',
      name: 'summary_degree',
      desc: '',
      args: [],
    );
  }

  /// `التقييم`
  String get summary_degree_title {
    return Intl.message(
      'التقييم',
      name: 'summary_degree_title',
      desc: '',
      args: [],
    );
  }

  /// `تحميل الملف`
  String get download_file {
    return Intl.message(
      'تحميل الملف',
      name: 'download_file',
      desc: '',
      args: [],
    );
  }

  /// `مدرسة `
  String get school {
    return Intl.message(
      'مدرسة ',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `تقرير الطالب للجانب الاكاديمي والسلوكي`
  String get reports_title {
    return Intl.message(
      'تقرير الطالب للجانب الاكاديمي والسلوكي',
      name: 'reports_title',
      desc: '',
      args: [],
    );
  }

  /// `التقرير الاكاديمي`
  String get reports_1 {
    return Intl.message(
      'التقرير الاكاديمي',
      name: 'reports_1',
      desc: '',
      args: [],
    );
  }

  /// `تقرير السلوك`
  String get reports_2 {
    return Intl.message(
      'تقرير السلوك',
      name: 'reports_2',
      desc: '',
      args: [],
    );
  }

  /// `المادة الدراسية`
  String get sub {
    return Intl.message(
      'المادة الدراسية',
      name: 'sub',
      desc: '',
      args: [],
    );
  }

  /// `الدرجة الكلية`
  String get total_degrees {
    return Intl.message(
      'الدرجة الكلية',
      name: 'total_degrees',
      desc: '',
      args: [],
    );
  }

  /// `درجة الطالب`
  String get degree_stu {
    return Intl.message(
      'درجة الطالب',
      name: 'degree_stu',
      desc: '',
      args: [],
    );
  }

  /// `التقدير الاكاديمي`
  String get academic_degree {
    return Intl.message(
      'التقدير الاكاديمي',
      name: 'academic_degree',
      desc: '',
      args: [],
    );
  }

  /// `ايام الغياب`
  String get number_of_absence_day {
    return Intl.message(
      'ايام الغياب',
      name: 'number_of_absence_day',
      desc: '',
      args: [],
    );
  }

  /// `ايام التأخير`
  String get number_of_delay_day {
    return Intl.message(
      'ايام التأخير',
      name: 'number_of_delay_day',
      desc: '',
      args: [],
    );
  }

  /// `نقاط إجابية`
  String get positive_point {
    return Intl.message(
      'نقاط إجابية',
      name: 'positive_point',
      desc: '',
      args: [],
    );
  }

  /// `نقاط سلبية`
  String get negative_point {
    return Intl.message(
      'نقاط سلبية',
      name: 'negative_point',
      desc: '',
      args: [],
    );
  }

  /// `التقدير السلوكي`
  String get appreciation_percentage {
    return Intl.message(
      'التقدير السلوكي',
      name: 'appreciation_percentage',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `بدون عنوان`
  String get no_title {
    return Intl.message(
      'بدون عنوان',
      name: 'no_title',
      desc: '',
      args: [],
    );
  }

  /// `بدون تفاصيل`
  String get no_dec {
    return Intl.message(
      'بدون تفاصيل',
      name: 'no_dec',
      desc: '',
      args: [],
    );
  }

  /// `الأراء`
  String get opinions {
    return Intl.message(
      'الأراء',
      name: 'opinions',
      desc: '',
      args: [],
    );
  }

  /// `المادة`
  String get sub_opinion {
    return Intl.message(
      'المادة',
      name: 'sub_opinion',
      desc: '',
      args: [],
    );
  }

  /// `الرسالة الإسبوعية`
  String get weekly_message {
    return Intl.message(
      'الرسالة الإسبوعية',
      name: 'weekly_message',
      desc: '',
      args: [],
    );
  }

  /// `حدد الشهر`
  String get choose_maoth {
    return Intl.message(
      'حدد الشهر',
      name: 'choose_maoth',
      desc: '',
      args: [],
    );
  }

  /// `حدد الإسبوع`
  String get choose_week {
    return Intl.message(
      'حدد الإسبوع',
      name: 'choose_week',
      desc: '',
      args: [],
    );
  }

  /// `الرسائل`
  String get messages {
    return Intl.message(
      'الرسائل',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد رسائل`
  String get no_messages {
    return Intl.message(
      'لا يوجد رسائل',
      name: 'no_messages',
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
