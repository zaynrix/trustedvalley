import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trustedtallentsvalley/fetures/Home/models/user_model.dart';
import 'package:trustedtallentsvalley/fetures/Home/providers/home_notifier.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/chipWidget.dart';

class UsersTable extends ConsumerWidget {
  const UsersTable({
    super.key,
    required this.users,
  });

  final List<DocumentSnapshot> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    // Get current selected user from provider
    final selectedUser = ref.watch(selectedUserProvider);
    final notifier = ref.read(homeProvider.notifier);

    return DataTable(
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
        // Highlight row if it's the selected user
        final isSelected = user.id == selectedUser?.id;

        return DataRow(
            color: MaterialStateColor.resolveWith(
                (states) => isSelected ? Colors.blue.shade50 : Colors.white),
            cells: [
              DataCell(SizedBox(
                width: screenWidth * 0.1, // Width of the fixed column
                child: Text(
                  user['aliasName'] ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
              )),
              DataCell(SizedBox(
                  width: screenWidth * 0.1, child: ChipWidget(isTrusted: user["isTrusted"]))),
              DataCell(SizedBox(
                // width: screenWidth * 0.1,
                child: TextButton.icon(
                  label: Text(
                    user['mobileNumber'] ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black54),
                  ),
                  onPressed: () {
                    // TODO: Implement copy functionality
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 12,
                  ),
                ),
              )),
              DataCell(GestureDetector(
                onTap: () {
                  // Use the notifier to update the state
                  notifier.visibleBar(selected: UserModel.fromFirestore(user));
                },
                child: const Text(
                  "المزيد",
                  style: TextStyle(color: Colors.blue),
                ),
              )),
            ]);
      }).toList(),
    );
  }
}
