import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/summary_model.dart';
import 'table_data_source.dart';

class CustomBuildSummaryTable extends StatefulWidget {
  const CustomBuildSummaryTable({super.key, required this.exams});
  final List<Exams> exams;

  @override
  State<CustomBuildSummaryTable> createState() =>
      _CustomBuildSummaryTableState();
}

class _CustomBuildSummaryTableState extends State<CustomBuildSummaryTable> {
  late TableDataSource tableDataSource;

  @override
  void initState() {
    tableDataSource = TableDataSource(
      exams: widget.exams,
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          gridLineColor: Colors.grey.shade400,
        ),
        child: SfDataGrid(
          source: tableDataSource,
          showHorizontalScrollbar: true,
          showVerticalScrollbar: true,
          headerRowHeight: 44,
          rowHeight: 48,
          // gridLinesVisibility: GridLinesVisibility.both,
          // headerGridLinesVisibility: GridLinesVisibility.both,
          columnWidthMode: ColumnWidthMode.fill,
          isScrollbarAlwaysShown: true,
          columns: [
            GridColumn(
              columnName: "subjectName",
              label: ColoredBox(
                color: const Color(0XFFFFFFFF),
                child: Center(
                  child: Text(
                    S.of(context).summary_subject_name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: "degree",
              label: ColoredBox(
                color: const Color(0XFFE6EFFF),
                child: Center(
                  child: Text(
                    S.of(context).summary_degree,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            GridColumn(
              columnName: "degreeTitle",
              label: ColoredBox(
                color: const Color(0XFFEFF9EE),
                child: Center(
                  child: Text(
                    S.of(context).summary_degree_title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
