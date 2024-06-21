import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTableVerticalLayout.dart';

//
class BlackListUsersScreen extends StatelessWidget {
  const BlackListUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // automaticallyImplyLeading: false,
        title: const Text('blackList').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('userstransed')
              .where('isTrusted', isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final users = snapshot.data!.docs;

            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 540) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minWidth: constraints.maxWidth),
                      child: Consumer<HomeProvider>(
                        builder: (context, provider, child) {
                          return provider.showSideBar == false
                              ? UsersTable(users: users)
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    UsersTable(users: users),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    provider.showSideBar == false
                                        ? const SizedBox()
                                        : const SideBarInformation()
                                  ],
                                );
                        },
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
        ),
      ),
    );
  }
}
