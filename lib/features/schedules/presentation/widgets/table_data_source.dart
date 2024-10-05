import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/models/schedules_model.dart';
import '../../data/models/sessions_model.dart';

class TableDataSource extends DataGridSource {
  final List<SchedulesModel> listSchedules;
  final List<SessionItem> listSessions;
  final BuildContext context;
  TableDataSource({
    required this.listSchedules,
    required this.listSessions,
    required this.context,
  }) {
    dataGridRows = listSchedules.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: "day", value: e.title),
        ...List.generate(
          listSessions.length,
          (index) => DataGridCell<String>(
              columnName: listSessions[index].title!,
              value: getValue(listSessions[index].title!, e.details!)),
        )
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == "day") {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            e.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
          ),
        );
      } else {
        return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              e.value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ));
      }
    }).toList());
  }

  getValue(String value, List<Details> details) {
    Details detailsData = details.firstWhere(
      (element) => element.sessionName == value,
    );
    return detailsData.categoryName;
  }
}
