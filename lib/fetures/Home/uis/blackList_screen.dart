import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trustedtallentsvalley/fetures/Home/providers/home_notifier.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/usersTableVerticalLayout.dart';

// Provider for blacklisted users stream
final blackListUsersStreamProvider = StreamProvider<QuerySnapshot>((ref) {
  return FirebaseFirestore.instance
      .collection('userstransed')
      .where('isTrusted', isEqualTo: false)
      .snapshots();
});

class BlackListUsersScreen extends ConsumerWidget {
  const BlackListUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('blackList').tr(), // Localized AppBar title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, child) {
            // Use Riverpod's StreamProvider
            final usersStreamAsync = ref.watch(blackListUsersStreamProvider);

            return usersStreamAsync.when(
              data: (snapshot) {
                final users = snapshot.docs;
                final showSideBar = ref.watch(showSideBarProvider);

                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 540) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints(minWidth: constraints.maxWidth),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UsersTable(users: users),
                              if (showSideBar)
                                const SizedBox(width: 20),
                              if (showSideBar)
                                const SideBarInformation(),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return VerticalLayout(
                        users: users,
                        constraints: constraints,
                      );
                    }
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            );
          },
        ),
      ),
    );
  }
}