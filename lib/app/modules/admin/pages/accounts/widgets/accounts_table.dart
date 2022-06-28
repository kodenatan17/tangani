import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../constants/styles.dart';
import '../../../widgets/custom_text.dart';

/// Example without a datasource
class AccountsTable extends StatelessWidget {
  const AccountsTable();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12,
            ),
          ],
          border: Border.all(color: lightGrey, width: .5),
        ),
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text('Nama'),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('Jenis Laporan'),
              ),
              DataColumn(
                label: Text('Laporan'),
              ),
              DataColumn(
                label: Text('Status Laporan'),
              ),
              DataColumn(
                label: Text('Pembuat Laporan'),
              ),
            ],
            rows: List<DataRow>.generate(
              12,
              (index) => DataRow(
                cells: [
                  DataCell(
                    CustomText(
                      text: "John Doe",
                      size: 14,
                      weight: FontWeight.normal,
                      color: lightGrey,
                    ),
                  ),
                  DataCell(
                    CustomText(
                      text: "01/01",
                      size: 14,
                      weight: FontWeight.normal,
                      color: lightGrey,
                    ),
                  ),
                  DataCell(
                    CustomText(
                      text: "Laporan Musyawarah",
                      size: 14,
                      weight: FontWeight.normal,
                      color: lightGrey,
                    ),
                  ),
                  DataCell(
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: active,
                          width: .5,
                        ),
                        color: light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: CustomText(
                        text: "Laporan Status",
                        color: active.withOpacity(.7),
                        weight: FontWeight.bold,
                        size: 14,
                      ),
                    ),
                  ),
                  DataCell(
                    CustomText(
                      text: "Laporan Musyawarah",
                      size: 14,
                      weight: FontWeight.normal,
                      color: lightGrey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
