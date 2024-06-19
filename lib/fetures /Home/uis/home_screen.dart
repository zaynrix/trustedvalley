import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTableVerticalLayout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('title').tr(),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('userstransed').snapshots(),
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
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Trusted Users'),
            onTap: () {
              // Handle the action for Trusted Users
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TrustedUsersScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('Black List Users'),
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
            title: const Text('دليل المعاملات'),
            onTap: () {
              // Handle the action for Transactions Guide
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionsGuideScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('تواصل معنا'),
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

class TrustedUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trusted Users'),
      ),
      body: const Center(
        child: Text('Content for Trusted Users'),
      ),
    );
  }
}

class BlackListUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black List Users'),
      ),
      body: const Center(
        child: Text('Content for Black List Users'),
      ),
    );
  }
}

class TransactionsGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دليل المعاملات'),
      ),
      body: const Center(
        child: Text('Content for Transactions Guide'),
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تواصل معنا'),
      ),
      body: const Center(
        child: Text('Content for Contact Us'),
      ),
    );
  }
}
