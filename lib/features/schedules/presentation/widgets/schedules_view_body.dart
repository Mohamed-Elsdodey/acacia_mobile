import 'package:evaluation_and_follow_up/core/widgets/custom_error_massage.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_loading_widget.dart';
import 'package:evaluation_and_follow_up/core/widgets/custom_refresh_page.dart';
import 'package:evaluation_and_follow_up/features/schedules/data/models/schedules_model.dart';
import 'package:evaluation_and_follow_up/features/schedules/data/models/sessions_model.dart';
import 'package:evaluation_and_follow_up/features/schedules/presentation/manager/sessions/sessions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart'; // Import printing package
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../core/utils/methods.dart';
import '../../../../generated/l10n.dart';
import '../manager/schedules/schedules_cubit.dart';
import 'custom_build_table.dart';

class SchedulesViewBody extends StatefulWidget {
  const SchedulesViewBody({super.key});

  @override
  State<SchedulesViewBody> createState() => _SchedulesViewBodyState();
}

class _SchedulesViewBodyState extends State<SchedulesViewBody> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true, // السماح بالتحريك
      boundaryMargin: EdgeInsets.all(20), // تحديد المسافة حول حدود العنصر
      minScale: 0.8, // مقياس التصغير الأدنى
      maxScale: 2.5, // مقياس التكبير الأقصى
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SessionsCubit, SessionsState>(
          builder: (context, state) {
            if (state is SessionsSuccess) {
              if (state.sessionsModel.status == 401) {
                return invalidToken(context);
              } else {
                List<SessionItem> listSessions = state.sessionsModel.data!;
                if (listSessions.isNotEmpty) {
                  return BlocBuilder<SchedulesCubit, SchedulesState>(
                    builder: (context, state) {
                      if (state is SchedulesSuccess) {
                        List<SchedulesModel> listSchedules = state.listSchedules;
                        if (listSchedules.isNotEmpty) {
                          return CustomRefreshPage(
                            onRefresh: () async {
                              await BlocProvider.of<SessionsCubit>(context)
                                  .getSessions();
                              if (context.mounted) {
                                await BlocProvider.of<SchedulesCubit>(context)
                                    .getSchedules();
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 40.w,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    S.of(context).schedules,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Expanded(
                                  child: Screenshot(
                                    controller: screenshotController,
                                    child: CustomBuildTable(
                                      listSchedules: listSchedules,
                                      listSessions: listSessions,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final screenshotImage =
                                        await screenshotController.capture();
                                    if (screenshotImage != null) {
                                      final pdf = pw.Document();
                                      final image =
                                          pw.MemoryImage(screenshotImage);
                                      pdf.addPage(
                                        pw.Page(
                                          pageFormat: PdfPageFormat.a4,
                                          build: (pw.Context context) {
                                            return pw.Center(
                                              child: pw.Image(image),
                                            );
                                          },
                                        ),
                                      );
                                      await Printing.layoutPdf(
                                        onLayout: (PdfPageFormat format) async =>
                                            pdf.save(),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 40.w,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      S.of(context).print,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(child: Text(S.of(context).no_schedules));
                        }
                      } else if (state is SchedulesFailure) {
                        return CustomErrorMassage(
                            errorMassage: state.errorMassage);
                      } else {
                        return const CustomLoadingWidget();
                      }
                    },
                  );
                } else {
                  return Center(child: Text(S.of(context).no_schedules));
                }
              }
            } else if (state is SessionsFailure) {
              return CustomErrorMassage(errorMassage: state.errorMassage);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
