import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/config/utils_config.dart';
import 'package:trustedtallentsvalley/routs/app_router.dart';
import 'package:trustedtallentsvalley/routs/route_generator.dart';
import 'package:trustedtallentsvalley/routs/screens_name.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

import 'fetures /Home/Providers/home_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC_xVfBVGpI6s371eh5m7zQIxy_s0LEqag",
          appId: "1:511012871086:web:3d64951c90d03b7a39463f",
          messagingSenderId: "511012871086",
          projectId: "truested-776cd"),
    );
  }
  await ScreenUtil.ensureScreenSize();
  await init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'AR'),
      child: const TrustedGazianApp()));
}

class TrustedGazianApp extends StatelessWidget {
  const TrustedGazianApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: sl<HomeProvider>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        initialRoute: ScreenName.homeScreen,
        navigatorKey: sl<AppRouter>().navigatorKey,
        scaffoldMessengerKey: UtilsConfig.scaffoldKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
