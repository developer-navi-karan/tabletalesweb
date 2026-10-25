import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

import 'dashboard_viewmodel.dart';

class DashboardViewDesktop extends ViewModelWidget<DashboardViewModel> {
  const DashboardViewDesktop({super.key});

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Stack(children: [
        Column(children: [
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: DataTable(
                        dataRowMaxHeight: double.infinity,
                        horizontalMargin: 15,
                        columnSpacing: 20,
                        headingRowColor: WidgetStateColor.resolveWith(
                            (states) => kcDataTableHeading),
                        border: TableBorder.all(
                          width: 1.5,
                          style: BorderStyle.none,
                          color: kcTableBorder,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        columns: const [
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'SR NO.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0,
                                    color: kcTableColumnName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Email',
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0,
                                    color: kcTableColumnName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Student Name',
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0,
                                    color: kcTableColumnName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Parent Name',
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0,
                                    color: kcTableColumnName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Mobile',
                                overflow: TextOverflow.visible,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0,
                                    color: kcTableColumnName,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                        rows: viewModel.data!
                            .mapIndexed((index, e) => DataRow(cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            color: kcTableColumnName,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        e?.email ?? '',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            color: kcTableColumnName,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        e?.student_name ?? '',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            color: kcTableColumnName,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        e?.parent_name ?? '',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            color: kcTableColumnName,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        e?.mobile ?? '',
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            color: kcTableColumnName,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ]))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container())
        ]),
      ]),
    );
  }
}
