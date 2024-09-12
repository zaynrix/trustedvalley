import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/config/utils_config.dart';
import 'package:trustedtallentsvalley/routs/app_router.dart';
import 'package:trustedtallentsvalley/routs/route_generator.dart';
import 'package:trustedtallentsvalley/service_locator.dart';
import 'package:trustedtallentsvalley/fetures /Home/Providers/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load();

  if (kIsWeb) {
   await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
    ));
  }
  
  await ScreenUtil.ensureScreenSize();
  await init();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ar', 'AR'),
    child: const TrustedGazianApp(),
  ));
}

class TrustedGazianApp extends StatelessWidget {
  const TrustedGazianApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: sl<HomeProvider>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        // routerDelegate: router.routerDelegate,
        // routeInformationParser: router.routeInformationParser,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: UtilsConfig.scaffoldKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
