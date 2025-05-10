import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:trustedtallentsvalley/fetures/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/providers/home_notifier.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/sideBarWidget.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/usersTable.dart';
import 'package:trustedtallentsvalley/fetures/Home/widgets/usersTableVerticalLayout.dart';

import '../../../routs/screens_name.dart';

// Provider for trusted users stream
final trustedUsersStreamProvider = StreamProvider<QuerySnapshot>((ref) {
  return FirebaseFirestore.instance
      .collection('userstransed')
      .where("isTrusted", isEqualTo: true)
      .snapshots();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if we're on mobile or web based on screen width
    final isMobile = MediaQuery.of(context).size.width <= 768;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Trusted Users'),
        // Only show drawer button on mobile
        automaticallyImplyLeading: isMobile,
      ),
      // Only use drawer for mobile layout
      drawer: isMobile ? const AppDrawer() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use row layout with permanent sidebar for web
          if (constraints.maxWidth > 768) {
            debugPrint("This is inside > 768 //////////*************");
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Permanent sidebar
                const AppDrawer(isPermanent: true),

                // Main content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildMainContent(constraints),
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout without permanent sidebar
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildMainContent(constraints),
            );
          }
        },
      ),
    );
  }

  Widget _buildMainContent(BoxConstraints constraints) {
    return Consumer(
      builder: (context, ref, child) {
        // Get the stream of users from Firestore
        final usersStreamAsync = ref.watch(trustedUsersStreamProvider);

        // Handle stream states
        return usersStreamAsync.when(
          data: (snapshot) {
            final users = snapshot.docs;
            final showSideBar = ref.watch(showSideBarProvider);

            if (constraints.maxWidth > 540) {
              // Layout for larger screens
              return SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UsersTable(users: users),
                      if (showSideBar) const SizedBox(width: 20),
                      if (showSideBar) const SideBarInformation(),
                    ],
                  ),
                ),
              );
            } else {
              // Layout for smaller screens
              return VerticalLayout(
                users: users,
                constraints: constraints,
              );
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        );
      },
    );
  }
}

class AppDrawer extends ConsumerWidget {
  final bool isPermanent;

  const AppDrawer({Key? key, this.isPermanent = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                'Group Management',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        if (isPermanent)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: const Text(
              'Group Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        _buildNavigationItem(
          context,
          icon: Icons.verified_user,
          label: "Trusted Users",
          route: ScreensNames.home,
          isPermanent: isPermanent,
        ),
        _buildNavigationItem(
          context,
          icon: Icons.block,
          label: "Black List",
          route: ScreensNames.untrusted,
          isPermanent: isPermanent,
        ),
        _buildNavigationItem(
          context,
          icon: Icons.description,
          label: 'How to Protect Yourself from Fraud',
          route: ScreensNames.instruction,
          isPermanent: isPermanent,
        ),
        _buildNavigationItem(
          context,
          icon: Icons.contact_mail,
          label: 'Contact Us',
          route: ScreensNames.contactUs,
          isPermanent: isPermanent,
        ),
      ],
    );
  }

  Widget _buildPermanentDrawer(BuildContext context) {
    return Container(
      width: 250,
      height: double.infinity,
      color: Colors.grey.shade200,
      child: _buildDrawerContent(context),
    );
  }

  Widget _buildNavigationItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String route,
        required bool isPermanent,
      }) {
    final bool isActive = GoRouterState.of(context).uri.toString() == route;

    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.green : null),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.green : null,
          fontWeight: isActive ? FontWeight.bold : null,
        ),
      ),
      tileColor: isActive ? Colors.grey.shade300 : null,
      onTap: () {
        if (!isPermanent) Navigator.pop(context);
        // Use GoRouter for navigation
        context.go(route);
      },
    );
  }
}