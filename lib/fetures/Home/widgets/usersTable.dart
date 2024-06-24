import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/models/user_model.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/chipWidget.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({
    super.key,
    required this.users,
  });

  final List<DocumentSnapshot> users;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => DataTable(
        headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.grey.shade200),
        columns: [
          DataColumn(label: const Text('aliasName').tr()),
          DataColumn(label: const Text('status').tr()),
          DataColumn(label: const Text('mobile_number').tr()),
          const DataColumn(label: Text('')),
        ],
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(6),
        ),
        rows: users.map((user) {
          return DataRow(
              color: MaterialStateColor.resolveWith((states) =>
                  user.id == value.selectedUser?.id
                      ? Colors.blue.shade50
                      : Colors.white),
              cells: [
                DataCell(SizedBox(
                  width: 200, // Width of the fixed column
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
                  icon: const Icon(
                    Icons.copy,
                    size: 12,
                  ),
                )),
                DataCell(Consumer<HomeProvider>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      value.visibleBar(selected: UserModel.fromFirestore(user));
                    },
                    child: const Text(
                      "المزيد",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                )),
              ]);
        }).toList(),
      ),
    );
  }
}
