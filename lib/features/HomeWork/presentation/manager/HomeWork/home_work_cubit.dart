import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/models/home_work_model.dart';
import '../../../data/repositories/home_work_repo.dart';
part 'home_work_state.dart';

class HomeWorkCubit extends Cubit<HomeWorkState> {
  HomeWorkCubit(this.homeWorkRepo) : super(HomeWorkInitial());
  final HomeWorkRepo homeWorkRepo;

  String selectedMonth = DateFormat.MMMM('ar').format(DateTime.now());
  String selectedDay = DateTime.now().day.toString();
  String selectedYear = DateTime.now().year.toString();

  List<String> days = List.generate(31, (index) => (index + 1).toString()); // أيام الشهر
  final List<String> years = ['2020', '2021', '2022', '2023', '2024'];

  final List<String> months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];


  Future<void> getHomeWork() async {
    try {
      emit(HomeWorkLoading());

      // تحويل الشهر النصي إلى فهرس (1-12)
      int monthIndex = months.indexOf(selectedMonth) + 1;
      if (monthIndex < 1 || monthIndex > 12) {
        print("Error: Invalid month index for $selectedMonth");
        emit(const HomeWorkFailure("Invalid month value"));
        return;
      }

      print('طلب البيانات للسنة: $selectedYear , الشهر: $monthIndex, اليوم: $selectedDay');

      Either<Failure, HomeWorkModel> result = await homeWorkRepo.getHomeWork(
        month: monthIndex.toString().padLeft(2, '0'),  // استخدام فهرس الشهر الصحيح
        day: selectedDay.padLeft(2, '0'),
        year: selectedYear,
      );

      result.fold((failure) {
        print("حدث خطأ: ${failure.errorMassage}");
        emit(HomeWorkFailure(failure.errorMassage));
      }, (result) {
        print('تم جلب البيانات بنجاح: ${result.data![0].title}');
        emit(HomeWorkSuccess(result));
      });
    } catch (e) {
      print("Error occurred: ${e.toString()}");
      emit(const HomeWorkFailure("Unexpected error occurred!"));
    }
  }


  void updateDaysInMonth(String selectedYear, String selectedMonth) {
    // الحصول على الفهرس الصحيح للشهر بناءً على موقعه في قائمة الأشهر
    int monthIndex = months.indexOf(selectedMonth) + 1; // إضافة 1 لأن الفهرس يبدأ من 0 والشهور تبدأ من 1

    if (monthIndex < 1 || monthIndex > 12) {
      print("Error: Invalid month index for $selectedMonth");
      return; // تجنب الحساب الخاطئ في حالة كان الشهر غير صالح
    }

    int year = int.parse(selectedYear);

    // حساب عدد أيام الشهر
    int daysInMonth = DateTime(year, monthIndex + 1, 0).day;

    // تحديث قائمة الأيام بناءً على عدد الأيام في الشهر
    days = List.generate(daysInMonth, (index) => (index + 1).toString());

    // إصدار حالة جديدة لتحديث الواجهة
    emit(HomeWorkDaysUpdated(days));
  }

  void updateDate(String year, String month, String day) {
    selectedYear = year;
    selectedMonth = month;
    selectedDay = day;

    getHomeWork();  // استدعاء جلب البيانات بعد تحديث التاريخ
  }
}
