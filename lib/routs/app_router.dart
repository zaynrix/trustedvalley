import 'package:flutter/material.dart';
import 'package:go_provider/go_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/Providers/home_provider.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/blackList_screen.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/contactUs_screen.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/home_screen.dart';
import 'package:trustedtallentsvalley/fetures/Home/uis/trade_screen.dart';
import 'package:trustedtallentsvalley/routs/screens_name.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

class AppRouter {
  late final GoRouter goRouter;

  AppRouter() {
    goRouter = GoRouter(
      initialLocation: '/trusted',

      // routes: [
      //   // Home Screen Route
      //   GoRoute(
      //     name: ScreensNames.trusted,
      //     path: '/trusted',
      //     builder: (context, state) {
      //       return const HomeScreen();
      //     },
      //   ),
      //
      //   // Black List Screen Route
      //   GoRoute(
      //     name: ScreensNames.untrusted,
      //     path: '/untrusted',
      //     builder: (context, state) {
      //       return const BlackListUsersScreen();
      //     },
      //   ),
      //
      //   // Transactions Guide Screen Route
      //   GoRoute(
      //     name: ScreensNames.instruction,
      //     path: '/instruction',
      //     builder: (context, state) {
      //       return const TransactionsGuideScreen();
      //     },
      //   ),
      //
      //   // Contact Us Screen Route
      //   GoRoute(
      //     name: ScreensNames.contactUs,
      //     path: '/contact-us',
      //     builder: (context, state) {
      //       return ContactUsScreen();
      //     },
      //   ),
      // ],
      routes: [
        ShellProviderRoute(
          providers: [
            ChangeNotifierProvider(
                create: (_) => sl<HomeProvider>()), // or BlocProvider
          ],
          builder: (context, state, child) =>
              const HomeScreen(), // ✅ can access FooState
          routes: [
            GoRoute(
              name: ScreensNames.trusted,
              path: '/trusted',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),

            // Black List Screen Route
            GoRoute(
              name: ScreensNames.untrusted,
              path: '/untrusted',
              builder: (context, state) {
                return const BlackListUsersScreen();
              },
            ),

            // Transactions Guide Screen Route
            GoRoute(
              name: ScreensNames.instruction,
              path: '/instruction',
              builder: (context, state) {
                return const TransactionsGuideScreen();
              },
            ),

            // Contact Us Screen Route
            GoRoute(
              name: ScreensNames.contactUs,
              path: '/contact-us',
              builder: (context, state) {
                return ContactUsScreen();
              },
            ),
            // GoRoute(
            //   path: '/a',
            //   builder: (context, state) => const PageA(), // ✅ can access FooState
            // ),
            // GoRoute(
            //   path: '/b',
            //   builder: (context, state) => const PageB(), // ✅ can access FooState
            // ),
          ],
        ),
      ],

      // Error Screen Route
      errorBuilder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Page not found', // Hardcoded error message
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  // Navigation methods to navigate between screens

  // Go to a path without any extra data
  void goTo(String path, {Object? extra}) {
    goRouter.go(path, extra: extra);
  }

  // Go to a named route
  void goToNamed(String name, {Object? extra}) {
    goRouter.goNamed(name, extra: extra);
  }

  // Push to a path (adding to the navigation stack)
  void pushTo(String path, {Object? extra}) {
    goRouter.push(path, extra: extra);
  }

  // Push to a named route (adding to the navigation stack)
  void pushToNamed(String name, {Object? extra}) {
    goRouter.pushNamed(name, extra: extra);
  }

  // Remove all routes and go to a new screen
  void removeAllAndGo(String name, {Object? extra}) {
    goRouter.goNamed(name, extra: extra);
  }

  // Go back to the previous screen
  void back<T extends Object?>([T? result]) {
    goRouter.pop(result);
  }

  // Go back to the previous screen if possible
  void maybeBack<T extends Object?>([T? result]) {
    if (goRouter.canPop()) {
      goRouter.pop(result);
    }
  }
}
