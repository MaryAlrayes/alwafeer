
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/helpers/compare.dart';
import '../screens/delegate_screen.dart';
import 'delegate_label.dart';


class SellingInfo extends StatefulWidget {
  final List<String> columns;
  final List<UserSellingPoint> data;
  const SellingInfo({
    Key? key,
    required this.columns,
    required this.data,
  }) : super(key: key);

  @override
  State<SellingInfo> createState() => _SellingInfoState();
}

class _SellingInfoState extends State<SellingInfo> {
  late List<UserSellingPoint> data;
  int? sortColumnIndex;
  bool isascending = false;
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(4),
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.purple.shade200, width: 1)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                DataTable(
                  sortColumnIndex: sortColumnIndex,
                  sortAscending: isascending,
                  columns: getColums(widget.columns),
                  rows: getRows(data),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

 Widget _buildLabel(BuildContext context) {
    return  DelegateLabel(label: AppLocalizations.of(context)!.my_selling_points);
  }

  List<DataColumn> getColums(List<String> columns) {
    return columns
        .map(
          (e) => DataColumn(
            onSort: (columnIndex, ascending) => onSort(columnIndex, ascending),
            label: Text(
              e,
              style: const TextStyle(
                  color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ),
        )
        .toList();
  }

  List<DataRow> getRows(List<UserSellingPoint> data) {
    return data.map((e) {
      final cells = [e.name, e.receivables, e.profit];
      return DataRow(cells: getCells(cells));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((cell) => DataCell(Text('$cell'))).toList();
  }

  void onSort(int columnIndex, bool ascending) {
    _sortData(columnIndex, ascending);
    _updateState(columnIndex, ascending);
  }

  void _updateState(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      isascending = ascending;
    });
  }

  void _sortData(int columnIndex, bool ascending) {
    switch (columnIndex) {
      case 0:

        data.sort(
          (data1, data2) => compareString(data1.name, data2.name, ascending),
        );
        break;
      case 1:

        data.sort(
          (data1, data2) =>
              compareDouble(data1.receivables, data2.receivables, ascending),
        );
        break;
      case 2:

        data.sort((data1, data2) =>
            compareDouble(data1.profit, data2.profit, ascending));
        break;
    }
  }
}
