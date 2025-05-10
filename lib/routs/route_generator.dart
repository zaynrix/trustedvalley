// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:trustedtallentsvalley/fetures%20/Home/uis/blackList_screen.dart';
// import 'package:trustedtallentsvalley/fetures%20/Home/uis/contactUs_screen.dart';
// import 'package:trustedtallentsvalley/fetures%20/Home/uis/trade_screen.dart';
// import 'package:trustedtallentsvalley/routs/screens_name.dart';
//
// import '../fetures /Home/uis/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:trustedtallentsvalley/routs/screens_name.dart';
//
// final GoRouter router = GoRouter(
//   initialLocation: '/trusted',
//   routes: [
//     GoRoute(
//       name: ScreensNames.trusted,
//       path: '/trusted',
//       builder: (context, state) => const HomeScreen(),
//     ),
//     // Add more routes here as needed
//   ],
//   errorBuilder: (context, state) => const Scaffold(
//     body: Center(
//       child: Text(
//         'Wrong path',
//         style: TextStyle(color: Colors.black, fontSize: 25),
//       ),
//     ),
//   ),
//
//   // Wrapper Methods
//   void goTo(String path, {Object? extra}) {
//     goRouter.go(path, extra: extra);
//   }
//
//   void goToNamed(String name, {Object? extra}) {
//     goRouter.goNamed(name, extra: extra);
//   }
//
//   void pushTo(String path, {Object? extra}) {
//     goRouter.push(path, extra: extra);
//   }
//
//   void pushToNamed(String name, {Object? extra}) {
//     goRouter.pushNamed(name, extra: extra);
//   }
//
//   void removeAllAndGo(String name, {Object? extra}) {
//     goRouter.goNamed(name, extra: extra);
//   }
//
//   void back<T extends Object?>([T? result]) {
//     goRouter.pop(result);
//   }
//
//   void maybeBack<T extends Object?>([T? result]) {
//     if (goRouter.canPop()) {
//       goRouter.pop(result);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/contactUs_screen.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/home_screen.dart';
import '../routs/screens_name.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: ScreensNames.home,
  routes: [
    GoRoute(
      path: ScreensNames.home,
      name: 'home',
      builder: (context, state) =>  HomeScreen(),
    ),
    // GoRoute(
    //   path: ScreensNames.untrusted,
    //   name: 'blacklist',
    //   builder: (context, state) => const UntrustedScreen(),
    // ),
    // GoRoute(
    //   path: ScreensNames.instruction,
    //   name: 'instruction',
    //   builder: (context, state) => const InstructionScreen(),
    // ),
    GoRoute(
      path: ScreensNames.contactUs,
      name: 'contactUs',
      builder: (context, state) =>  ContactUsScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Page Not Found')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The page you were looking for does not exist.'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go(ScreensNames.home),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
);