import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/uis/home_screen.dart';
import 'package:trustedtallentsvalley/routs/screens_name.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

import '../fetures /Home/Providers/home_provider.dart';

final GoRouter router = GoRouter(
  initialLocation: "/trusted",
  routes: [
    
    GoRoute(
      path: '/trusted',
      builder: (context, state) {
        return ChangeNotifierProvider.value(
          value: sl<HomeProvider>(),
          child:  HomeScreen(),
        );
      },
    ),
    // Define additional routes here
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text(
        'Wrong path',
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
    ),
  ),
);