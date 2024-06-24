import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VerticalLayout extends StatelessWidget {
  const VerticalLayout({
    super.key,
    required this.users,
    required this.constraints,
  });
  final BoxConstraints constraints;
  final List<DocumentSnapshot> users;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        columns: const [
          DataColumn(label: Text('Alias Name')),
          DataColumn(label: Text('Mobile Number')),
          DataColumn(label: Text('Location')),
          DataColumn(label: Text('Services Provided')),
          DataColumn(label: Text('Telegram Account')),
          DataColumn(label: Text('Other Accounts')),
          DataColumn(label: Text('Reviews')),
        ],
        rows: users.map((user) {
          return DataRow(
            cells: [
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.1,
                child: Text(
                  user['aliasName'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.1,
                child: Text(
                  user['mobileNumber'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.15,
                child: Text(
                  user['location'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.2,
                child: Text(
                  user['servicesProvided'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.18,
                child: Text(
                  user['telegramAccount'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.18,
                child: Text(
                  user['otherAccounts'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                width: constraints.maxWidth * 0.08,
                child: Text(
                  user['reviews'],
                  overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          );
        }).toList(),
      ),
    );
  }
}
