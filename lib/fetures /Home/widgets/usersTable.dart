import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/chipWidget.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({
    super.key,
    required this.users,
  });

  final List<DocumentSnapshot> users;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => Column(
        children: [
          // Single DataTable (No use of Flexible widget inside non-Flex parent)
          DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => Colors.grey.shade200),
            columns: [
              DataColumn(label: const Text('aliasName').tr()),
              DataColumn(label: const Text('status').tr()),
              DataColumn(label: const Text('mobile_number').tr()),
            ],
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(6),
            ),
            rows: users.map((user) {
              final isSelected = value.selectedUser?.id == user.id;

              return DataRow(
                color: MaterialStateColor.resolveWith((states) =>
                    isSelected ? Colors.blue.shade50 : Colors.white),
                cells: [
                  DataCell(SizedBox(
                    width: 200,
                    child: Text(
                      user['aliasName'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  DataCell(ChipWidget(isTrusted: user["isTrusted"])),
                  DataCell(TextButton.icon(
                    label: Text(
                      user['mobileNumber'] ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black54),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.copy, size: 12),
                  )),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
