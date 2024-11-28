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

  /// `Choose School`
  String get choose_school {
    return Intl.message(
      'Choose School',
      name: 'choose_school',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the school code!❤`
  String get p_choose_school {
    return Intl.message(
      'Please enter the school code!❤',
      name: 'p_choose_school',
      desc: '',
      args: [],
    );
  }

  /// `School Code`
  String get school_code {
    return Intl.message(
      'School Code',
      name: 'school_code',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to School`
  String get welcome {
    return Intl.message(
      'Welcome to School',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Choose Another School`
  String get choose_anther_school {
    return Intl.message(
      'Choose Another School',
      name: 'choose_anther_school',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_is_required {
    return Intl.message(
      'This field is required',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Motivation`
  String get motivation {
    return Intl.message(
      'Motivation',
      name: 'motivation',
      desc: '',
      args: [],
    );
  }

  /// `Children`
  String get childern {
    return Intl.message(
      'Children',
      name: 'childern',
      desc: '',
      args: [],
    );
  }

  /// `Classes`
  String get classes {
    return Intl.message(
      'Classes',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Absences and Tardiness`
  String get absences {
    return Intl.message(
      'Absences and Tardiness',
      name: 'absences',
      desc: '',
      args: [],
    );
  }

  /// `Account Data`
  String get data_acount {
    return Intl.message(
      'Account Data',
      name: 'data_acount',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get about_app {
    return Intl.message(
      'About the App',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `No children`
  String get no_childern {
    return Intl.message(
      'No children',
      name: 'no_childern',
      desc: '',
      args: [],
    );
  }

  /// `Row: `
  String get row {
    return Intl.message(
      'Row: ',
      name: 'row',
      desc: '',
      args: [],
    );
  }

  /// `Room: `
  String get room {
    return Intl.message(
      'Room: ',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `Rank in school: `
  String get rank_school {
    return Intl.message(
      'Rank in school: ',
      name: 'rank_school',
      desc: '',
      args: [],
    );
  }

  /// `Rank in row: `
  String get rank_row {
    return Intl.message(
      'Rank in row: ',
      name: 'rank_row',
      desc: '',
      args: [],
    );
  }

  /// `Rank in room: `
  String get rank_room {
    return Intl.message(
      'Rank in room: ',
      name: 'rank_room',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired, please log in again.`
  String get warning_massge {
    return Intl.message(
      'Your session has expired, please log in again.',
      name: 'warning_massge',
      desc: '',
      args: [],
    );
  }

  /// `Student Status: `
  String get st_info {
    return Intl.message(
      'Student Status: ',
      name: 'st_info',
      desc: '',
      args: [],
    );
  }

  /// `Points: `
  String get points {
    return Intl.message(
      'Points: ',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance: `
  String get total_point {
    return Intl.message(
      'Total Balance: ',
      name: 'total_point',
      desc: '',
      args: [],
    );
  }

  /// `Subject: `
  String get subject {
    return Intl.message(
      'Subject: ',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Subject Teacher Name: `
  String get teacher {
    return Intl.message(
      'Subject Teacher Name: ',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `Teacher Name: `
  String get sub_teacher {
    return Intl.message(
      'Teacher Name: ',
      name: 'sub_teacher',
      desc: '',
      args: [],
    );
  }

  /// `Total Degree: `
  String get total_degree {
    return Intl.message(
      'Total Degree: ',
      name: 'total_degree',
      desc: '',
      args: [],
    );
  }

  /// `Student Degree: `
  String get st_degree {
    return Intl.message(
      'Student Degree: ',
      name: 'st_degree',
      desc: '',
      args: [],
    );
  }

  /// `Date: `
  String get date {
    return Intl.message(
      'Date: ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Total Positive Balance: `
  String get total_positive {
    return Intl.message(
      'Total Positive Balance: ',
      name: 'total_positive',
      desc: '',
      args: [],
    );
  }

  /// `Total Negative Balance: `
  String get total_nagative {
    return Intl.message(
      'Total Negative Balance: ',
      name: 'total_nagative',
      desc: '',
      args: [],
    );
  }

  /// `Positive`
  String get positive {
    return Intl.message(
      'Positive',
      name: 'positive',
      desc: '',
      args: [],
    );
  }

  /// `Negative`
  String get nagative {
    return Intl.message(
      'Negative',
      name: 'nagative',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_massge {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_massge',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No motivation`
  String get no_reviews {
    return Intl.message(
      'No motivation',
      name: 'no_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Email is invalid`
  String get no_email {
    return Intl.message(
      'Email is invalid',
      name: 'no_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is incorrect`
  String get no_password {
    return Intl.message(
      'Password is incorrect',
      name: 'no_password',
      desc: '',
      args: [],
    );
  }

  /// `No exams available`
  String get no_exams {
    return Intl.message(
      'No exams available',
      name: 'no_exams',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `No notifications`
  String get no_notifications {
    return Intl.message(
      'No notifications',
      name: 'no_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation does not match`
  String get invalid_password {
    return Intl.message(
      'Password confirmation does not match',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `Data updated successfully`
  String get updated_successfully {
    return Intl.message(
      'Data updated successfully',
      name: 'updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `No absences or tardiness`
  String get no_absence {
    return Intl.message(
      'No absences or tardiness',
      name: 'no_absence',
      desc: '',
      args: [],
    );
  }

  /// `Student Status: `
  String get student_type {
    return Intl.message(
      'Student Status: ',
      name: 'student_type',
      desc: '',
      args: [],
    );
  }

  /// `Tardiness`
  String get delay {
    return Intl.message(
      'Tardiness',
      name: 'delay',
      desc: '',
      args: [],
    );
  }

  /// `Absence`
  String get absence {
    return Intl.message(
      'Absence',
      name: 'absence',
      desc: '',
      args: [],
    );
  }

  /// `Number of Tardiness Days: `
  String get day_delay {
    return Intl.message(
      'Number of Tardiness Days: ',
      name: 'day_delay',
      desc: '',
      args: [],
    );
  }

  /// `Number of Absence Days: `
  String get day_absence {
    return Intl.message(
      'Number of Absence Days: ',
      name: 'day_absence',
      desc: '',
      args: [],
    );
  }

  /// `Total Absence: `
  String get total_absence {
    return Intl.message(
      'Total Absence: ',
      name: 'total_absence',
      desc: '',
      args: [],
    );
  }

  /// `Total Tardiness: `
  String get total_delay {
    return Intl.message(
      'Total Tardiness: ',
      name: 'total_delay',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Behavior`
  String get behavior {
    return Intl.message(
      'Behavior',
      name: 'behavior',
      desc: '',
      args: [],
    );
  }

  /// `Academic`
  String get academic {
    return Intl.message(
      'Academic',
      name: 'academic',
      desc: '',
      args: [],
    );
  }

  /// `Daily Schedules`
  String get schedules {
    return Intl.message(
      'Daily Schedules',
      name: 'schedules',
      desc: '',
      args: [],
    );
  }

  /// `No schedules available`
  String get no_schedules {
    return Intl.message(
      'No schedules available',
      name: 'no_schedules',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `No school found with this code`
  String get no_school_code {
    return Intl.message(
      'No school found with this code',
      name: 'no_school_code',
      desc: '',
      args: [],
    );
  }

  /// `No summary available`
  String get no_summary {
    return Intl.message(
      'No summary available',
      name: 'no_summary',
      desc: '',
      args: [],
    );
  }

  /// `Your performance`
  String get summary_title1 {
    return Intl.message(
      'Your performance',
      name: 'summary_title1',
      desc: '',
      args: [],
    );
  }

  /// ` this month .. keep improving`
  String get summary_title2 {
    return Intl.message(
      ' this month .. keep improving',
      name: 'summary_title2',
      desc: '',
      args: [],
    );
  }

  /// `Subject Name`
  String get summary_subject_name {
    return Intl.message(
      'Subject Name',
      name: 'summary_subject_name',
      desc: '',
      args: [],
    );
  }

  /// `Degree`
  String get summary_degree {
    return Intl.message(
      'Degree',
      name: 'summary_degree',
      desc: '',
      args: [],
    );
  }

  /// `Evaluation`
  String get summary_degree_title {
    return Intl.message(
      'Evaluation',
      name: 'summary_degree_title',
      desc: '',
      args: [],
    );
  }

  /// `Download File`
  String get download_file {
    return Intl.message(
      'Download File',
      name: 'download_file',
      desc: '',
      args: [],
    );
  }

  /// `School`
  String get school {
    return Intl.message(
      'School',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Student Report for Academic and Behavioral Aspects`
  String get reports_title {
    return Intl.message(
      'Student Report for Academic and Behavioral Aspects',
      name: 'reports_title',
      desc: '',
      args: [],
    );
  }

  /// `Academic Report`
  String get reports_1 {
    return Intl.message(
      'Academic Report',
      name: 'reports_1',
      desc: '',
      args: [],
    );
  }

  /// `Behavioral Report`
  String get reports_2 {
    return Intl.message(
      'Behavioral Report',
      name: 'reports_2',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get sub {
    return Intl.message(
      'Subject',
      name: 'sub',
      desc: '',
      args: [],
    );
  }

  /// `Total Degree`
  String get total_degrees {
    return Intl.message(
      'Total Degree',
      name: 'total_degrees',
      desc: '',
      args: [],
    );
  }

  /// `Student Degree`
  String get degree_stu {
    return Intl.message(
      'Student Degree',
      name: 'degree_stu',
      desc: '',
      args: [],
    );
  }

  /// `Academic Grade`
  String get academic_degree {
    return Intl.message(
      'Academic Grade',
      name: 'academic_degree',
      desc: '',
      args: [],
    );
  }

  /// `Days of Absence`
  String get number_of_absence_day {
    return Intl.message(
      'Days of Absence',
      name: 'number_of_absence_day',
      desc: '',
      args: [],
    );
  }

  /// `Days of Tardiness`
  String get number_of_delay_day {
    return Intl.message(
      'Days of Tardiness',
      name: 'number_of_delay_day',
      desc: '',
      args: [],
    );
  }

  /// `Positive Points`
  String get positive_point {
    return Intl.message(
      'Positive Points',
      name: 'positive_point',
      desc: '',
      args: [],
    );
  }

  /// `Negative Points`
  String get negative_point {
    return Intl.message(
      'Negative Points',
      name: 'negative_point',
      desc: '',
      args: [],
    );
  }

  /// `Behavioral Rating`
  String get appreciation_percentage {
    return Intl.message(
      'Behavioral Rating',
      name: 'appreciation_percentage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `No Title`
  String get no_title {
    return Intl.message(
      'No Title',
      name: 'no_title',
      desc: '',
      args: [],
    );
  }

  /// `No Details`
  String get no_dec {
    return Intl.message(
      'No Details',
      name: 'no_dec',
      desc: '',
      args: [],
    );
  }

  /// `Opinions`
  String get opinions {
    return Intl.message(
      'Opinions',
      name: 'opinions',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get sub_opinion {
    return Intl.message(
      'Subject',
      name: 'sub_opinion',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Message`
  String get weekly_message {
    return Intl.message(
      'Weekly Message',
      name: 'weekly_message',
      desc: '',
      args: [],
    );
  }

  /// `Select Month`
  String get choose_maoth {
    return Intl.message(
      'Select Month',
      name: 'choose_maoth',
      desc: '',
      args: [],
    );
  }

  /// `Select Week`
  String get choose_week {
    return Intl.message(
      'Select Week',
      name: 'choose_week',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Print`
  String get print {
    return Intl.message(
      'Print',
      name: 'print',
      desc: '',
      args: [],
    );
  }

  /// `Choose day`
  String get choose_day {
    return Intl.message(
      'Choose day',
      name: 'choose_day',
      desc: '',
      args: [],
    );
  }

  /// `Choose year`
  String get choose_year {
    return Intl.message(
      'Choose year',
      name: 'choose_year',
      desc: '',
      args: [],
    );
  }

  /// `Homework`
  String get home_work {
    return Intl.message(
      'Homework',
      name: 'home_work',
      desc: '',
      args: [],
    );
  }

  /// `No messages`
  String get no_messages {
    return Intl.message(
      'No messages',
      name: 'no_messages',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Link cannot be opened: `
  String get no_open_link {
    return Intl.message(
      'Link cannot be opened: ',
      name: 'no_open_link',
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
