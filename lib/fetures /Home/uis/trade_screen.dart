import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransactionsGuideScreen extends StatelessWidget {
  const TransactionsGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: const Text('trade').tr(),
      ),
      body: const Center(
        child: Text('Content for Transactions Guide'),
      ),
    );
  }
}
