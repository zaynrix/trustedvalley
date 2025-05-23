import 'dart:async';

import 'package:trustedtallentsvalley/routs/app_router.dart';
import 'package:trustedtallentsvalley/routs/screens_name.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

// import 'package:gym_app/logic/localData/shared_pref.dart';
// import 'package:gym_app/routes/app_router.dart';
// import 'package:gym_app/routes/screen_name.dart';
// import 'package:gym_app/service_locator.dart';

class AppConfig {
  // var pef = sl<SharedPrefController>();
  var nav = sl<AppRouter>();

  void onBoardingStatue() {
    Timer(const Duration(seconds: 3), () {
      // checkFirstSeen();
      nav.goTo(ScreensNames.BNBUser);
    });
  }

  // Future<void> checkFirstSeen() async {
  //   bool seen = await pef.getShowOnce();
  //   bool isAuthenticated = sl<SharedPrefController>().getUserData().uid != "";
  //   print("is Auth ? $isAuthenticated");
  //   if (seen) {
  //     if (isAuthenticated) {
  //       nav.goToAndRemove(ScreensNames: ScreensNames.BNBUser);
  //     } else {
  //       nav.goToAndRemove(ScreensNames: ScreensNames.loginScreen);
  //     }
  //   } else {
  //     sl<SharedPrefController>().setShowOnce(true);
  //     nav.goToAndRemove(ScreensNames: ScreensNames.pageViewScreens);
  //   }
  // }
}
