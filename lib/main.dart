import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/routs/app_router.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

import 'fetures/Home/providers/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC_xVfBVGpI6s371eh5m7zQIxy_s0LEqag",
        appId: "1:511012871086:web:3d64951c90d03b7a39463f",
        messagingSenderId: "511012871086",
        projectId: "truested-776cd",
      ),
    );
  }

  await ScreenUtil.ensureScreenSize();
  await init(); // Initializes service locator

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => sl<HomeProvider>(), // Inject HomeProvider
        ),
      ],
      child: const TrustedGazianApp(),
    ),
  );
}

class TrustedGazianApp extends StatelessWidget {
  const TrustedGazianApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the AppRouter
    final appRouter = sl<AppRouter>();

    return MaterialApp.router(
      routerConfig: appRouter.goRouter, // Using the GoRouter configuration
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
      locale: const Locale('ar', 'AR'), // Set your app's default locale here
      // supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
    );
  }
}
