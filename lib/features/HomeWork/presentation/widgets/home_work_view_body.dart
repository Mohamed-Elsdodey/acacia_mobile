import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evaluation_and_follow_up/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/home_work_model.dart';
import '../manager/HomeWork/home_work_cubit.dart';

class HomeWorkViewBody extends StatefulWidget {
  const HomeWorkViewBody({super.key});

  @override
  State<HomeWorkViewBody> createState() => _HomeWorkViewBodyState();
}

class _HomeWorkViewBodyState extends State<HomeWorkViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeWorkCubit>(context).getHomeWork();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeWorkCubit, HomeWorkState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeWorkCubit>(context);

        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildYearDropdown(cubit)),
                    Expanded(child: _buildMonthDropdown(cubit)),
                    Expanded(child: _buildDayDropdown(cubit)),
                  ],
                ),
                SizedBox(height: 20.sp),
                if (state is HomeWorkLoading)
                  CircularProgressIndicator(),
                if (state is HomeWorkSuccess)
                  _buildHomeWorkTable(state.homeWorkModel),
                if (state is HomeWorkFailure)
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 100.w),
                    child: Text(
                      state.errorMassage,
                      style: TextStyle(color: Colors.red, fontSize: 16.sp),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildYearDropdown(HomeWorkCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.sp),
          child: Text(S.of(context).choose_year, style: TextStyle(color: Colors.grey)),
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          elevation: 2,
          child: CustomDropdown<String>(
            initialItem: cubit.selectedYear,
            closedHeaderPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: CustomDropdownDecoration(
              headerStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
              closedFillColor: Colors.transparent,
            ),
            items: cubit.years,
            onChanged: (value) {
              if (value != null) {
                cubit.updateDate(value, cubit.selectedMonth, cubit.selectedDay);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMonthDropdown(HomeWorkCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.sp),
          child: Text(S.of(context).choose_maoth, style: TextStyle(color: Colors.grey)),
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: CustomDropdown<String>(
            initialItem: cubit.selectedMonth,
            closedHeaderPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
            decoration: CustomDropdownDecoration(
              headerStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
              closedFillColor: Colors.transparent,
            ),
            items: cubit.months,
            onChanged: (value) {
              if (value != null) {
                cubit.updateDate(cubit.selectedYear, value, cubit.selectedDay);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDayDropdown(HomeWorkCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 8.sp),
          child: Text(S.of(context).choose_day, style: TextStyle(color: Colors.grey)),
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.sp),
          ),
          elevation: 2,
          child: CustomDropdown<String>(
            initialItem: cubit.selectedDay,
            closedHeaderPadding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.w),
            decoration: CustomDropdownDecoration(
              headerStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
              closedFillColor: Colors.transparent,
            ),
            items: cubit.days,
            onChanged: (value) {
              if (value != null) {
                cubit.updateDate(cubit.selectedYear, cubit.selectedMonth, value);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHomeWorkTable(HomeWorkModel model) {
    return Column(
      children: [
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.sp),
              topRight: Radius.circular(8.sp),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 120.w,
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: BorderDirectional(end: BorderSide(color: Colors.grey.shade400)),
                ),
                child: Text(
                  S.of(context).subject,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 48.h,
                  child: Text(
                    S.of(context).home_work,
                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        ...List.generate(
          model.data!.length,
              (index) {
            return Container(
              height: 48,
              decoration: BoxDecoration(
                color: index.isOdd ? Colors.white : Theme.of(context).primaryColor.withOpacity(.1),
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 48,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      border: BorderDirectional(end: BorderSide(color: Colors.grey.shade400)),
                    ),
                    child: Text(
                      model.data![index].title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      model.data![index].homeWork!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
