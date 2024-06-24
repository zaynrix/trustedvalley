import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('contact').tr(),
      ),
      body: const Center(
        child: Text('Content for Contact Us'),
      ),
    );
  }
}
