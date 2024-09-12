import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/uis/contactUs_screen.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/uis/trade_screen.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTableVerticalLayout.dart';
import 'blackList_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        // automaticallyImplyLeading: false,
        title: const Text('title').tr(),
        actions: [
          TextButton(
              onPressed: () {
                if (context.locale ==
                    const Locale('en', 'US')) {
                 context
                      .setLocale(const Locale('ar', 'AR'));
                } else {
                 context
                      .setLocale(const Locale('en', 'US'));
                }
              },
              child: Text(
               context.locale ==
                        const Locale('en', 'US')
                    ? "العربية"
                    : "English",
                style: const TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('userstransed')
              .where("isTrusted", isEqualTo: true)
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

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Center(
              child: Text(
                'ادارة جروب الحوالات المالية',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('blackList').tr(),
            onTap: () {
              // Handle the action for Black List Users
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlackListUsersScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('trade').tr(),
            onTap: () {
              // Handle the action for Transactions Guide
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TransactionsGuideScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('contact').tr(),
            onTap: () {
              // Handle the action for Contact Us
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
