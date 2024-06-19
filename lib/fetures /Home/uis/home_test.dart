import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this); // Adjust the length according to your number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Trusted Users'),
            Tab(text: 'Black Users'),
            Tab(text: 'Transactions'),
            Tab(text: 'Contact Us'),
          ],
        ),
      ),
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

            return TabBarView(
              controller: _tabController,
              children: [
                TrustedUsersScreen(users: users),
                BlackUsersScreen(users: users),
                TransactionsGuideScreen(),
                ContactUsScreen(),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class TrustedUsersScreen extends StatelessWidget {
  final List<DocumentSnapshot> users;

  const TrustedUsersScreen({required this.users});

  @override
  Widget build(BuildContext context) {
    // Replace with your Trusted Users screen content
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]
              .id), // Example: Adjust based on your Firestore data structure
        );
      },
    );
  }
}

class BlackUsersScreen extends StatelessWidget {
  final List<DocumentSnapshot> users;

  const BlackUsersScreen({required this.users});

  @override
  Widget build(BuildContext context) {
    // Replace with your Black Users screen content
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index]
              .id), // Example: Adjust based on your Firestore data structure
        );
      },
    );
  }
}

class TransactionsGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your Transactions Guide screen content
    return Container(
      child: Center(
        child: Text('Transactions Guide Screen'),
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your Contact Us screen content
    return Container(
      child: Center(
        child: Text('Contact Us Screen'),
      ),
    );
  }
}
