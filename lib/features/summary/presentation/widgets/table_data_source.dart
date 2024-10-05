import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../data/models/summary_model.dart';

class TableDataSource extends DataGridSource {
  final List<Exams> exams;
  final BuildContext context;
  TableDataSource({
    required this.exams,
    required this.context,
  }) {
    dataGridRows = exams.map<DataGridRow>((e) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: "subjectName", value: e.categoryName),
        DataGridCell<int>(columnName: "degree", value: e.degreeOfStudent),
        DataGridCell<String>(
            columnName: "degreeTitle", value: e.percentageTitle),
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
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          color: e.columnName == "subjectName"
              ? const Color(0XFFFFFFFF)
              : e.columnName == "degree"
                  ? const Color(0XFFE6EFFF)
                  : const Color(0XFFEFF9EE),
          child: Text(
            e.value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
          ));
    }).toList());
  }
}
