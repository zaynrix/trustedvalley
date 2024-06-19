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
          apiKey: "AIzaSyBKJlrb0x0TOysC9F8nQ7WqMXsS807-KsU",
          appId: "1:669134402500:web:ea1ed752554832c0d72a91",
          messagingSenderId: "669134402500",
          projectId: "mobile-informations"),
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
