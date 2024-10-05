import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/schedules_model.dart';
import '../../data/models/sessions_model.dart';
import 'table_data_source.dart';

class CustomBuildTable extends StatefulWidget {
  const CustomBuildTable(
      {super.key, required this.listSchedules, required this.listSessions});

  final List<SchedulesModel> listSchedules;
  final List<SessionItem> listSessions;

  @override
  State<CustomBuildTable> createState() => _CustomBuildTableState();
}

class _CustomBuildTableState extends State<CustomBuildTable> {
  late TableDataSource tableDataSource;

  @override
  void initState() {
    tableDataSource = TableDataSource(
      listSessions: widget.listSessions,
      listSchedules: widget.listSchedules,
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        gridLineColor: Colors.grey.shade400,
        headerColor: const Color(0xff555555),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SfDataGrid(
          source: tableDataSource,
          showHorizontalScrollbar: true,
          showVerticalScrollbar: true,
          headerRowHeight: 44,
          rowHeight: 48,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          columnWidthMode: ColumnWidthMode.fill,
          isScrollbarAlwaysShown: true,
          columns: [
            GridColumn(
              columnName: "day",
              label: Center(
                child: Text(
                  S.of(context).day,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            ...List.generate(
              widget.listSessions.length,
              (index) => GridColumn(
                columnName: widget.listSessions[index].title!,
                label: Center(
                  child: Text(
                    widget.listSessions[index].title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
