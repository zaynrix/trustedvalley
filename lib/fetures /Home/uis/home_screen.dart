import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/widgets/usersTableVerticalLayout.dart';

import '../../../routs/screens_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeProvider>(context); // Access HomeProvider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Trusted Users'), // Hardcoded title
      ),
      drawer: const AppDrawer(),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UsersTable(users: users),
                          if (homeProvider.showSideBar)
                            const SizedBox(width: 20),
                          if (homeProvider.showSideBar)
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
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final bool isPermanent;

  const AppDrawer({Key? key, this.isPermanent = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPermanent
        ? _buildPermanentDrawer(context)
        : Drawer(child: _buildDrawerContent(context));
  }

  Widget _buildDrawerContent(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        if (!isPermanent)
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Center(
              child: Text(
                'Group Management', // Hardcoded text for group management
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        _buildDrawerItem(
          context,
          icon: Icons.block,
          label: "Black List", // Hardcoded label
          route: ScreensNames.untrusted,
        ),
        _buildDrawerItem(
          context,
          icon: Icons.description,
          label: 'How to Protect Yourself from Fraud', // Hardcoded label
          route: ScreensNames.instruction,
        ),
        _buildDrawerItem(
          context,
          icon: Icons.contact_mail,
          label: 'Contact Us', // Hardcoded label
          route: ScreensNames.contactUs,
        ),
      ],
    );
  }

  Widget _buildPermanentDrawer(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey.shade200,
      child: _buildDrawerContent(context),
    );
  }

  ListTile _buildDrawerItem(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label), // Hardcoded label
      onTap: () {
        if (!isPermanent) Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
