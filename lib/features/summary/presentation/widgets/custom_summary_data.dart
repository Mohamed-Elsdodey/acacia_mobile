import 'dart:io';
import 'dart:typed_data';

import 'package:evaluation_and_follow_up/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/helper/AlertDialog/custom_alert_dialog.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_button_with_icon.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/summary_model.dart';
import 'custom_build_summary_table.dart';

class CustomSummaryData extends StatefulWidget {
  const CustomSummaryData({super.key, required this.summaryData});
  final SummaryData summaryData;

  @override
  State<CustomSummaryData> createState() => _CustomSummaryDataState();
}

class _CustomSummaryDataState extends State<CustomSummaryData> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(.5),
                        width: 5,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          AppAssets.star,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          '${widget.summaryData.percentage}%',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "${S.of(context).summary_title1}${widget.summaryData.percentageTitle}${S.of(context).summary_title2}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Text(
                    "${HomeView.studentname} !!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  CustomBuildSummaryTable(
                      exams: widget.summaryData.exams ?? []),
                ],
              ),
            ),
            CustomButtonWithIcon(
              height: 50,
              title: S.of(context).download_file,
              onTap: _captureAndSave,
              titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              icon: Image.asset(
                AppAssets.download,
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _captureAndSave() async {
    try {
      final Uint8List? imageBytes = await screenshotController.capture();
      if (imageBytes != null) {
        final pdf = pw.Document();
        final image = pw.MemoryImage(imageBytes);

        pdf.addPage(pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(image),
            );
          },
        ));

        final directory = await getExternalStorageDirectory();
        if (directory != null) {
          final path = '${directory.path}/${HomeView.studentname}.pdf';
          final file = File(path);

          await file.writeAsBytes(await pdf.save());

          CustomAlertDialog.alertWithButton(
              context: context,
              type: AlertType.success,
              title: "تم حفظ PDF بنجاح في: ",
              desc: path);
        }
      }
    } catch (e) {
      debugPrint('خطأ: $e');
    }
  }
}
