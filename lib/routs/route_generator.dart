import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trustedtallentsvalley/fetures%20/Home/uis/home_screen.dart';
import 'package:trustedtallentsvalley/routs/screens_name.dart';
import 'package:trustedtallentsvalley/service_locator.dart';

import '../fetures /Home/Providers/home_provider.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget result;
    switch (settings.name) {
      // --------------------------- splashScreen ------------------------------
      //   case ScreenName.splashScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => const SplashScreen(),
      //     );
      // // --------------------------- PageViewScreens ---------------------------
      //   case ScreenName.pageViewScreens:
      //     return MaterialPageRoute(
      //       builder: (_) => const PageViewScreens(),
      //     );
      // // --------------------------- SignUpScreen ------------------------------
      //   case ScreenName.signUpScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => MultiProvider(
      //         providers: [
      //           ChangeNotifierProvider(
      //             create: (context) => SignUpProvider(),
      //           ),
      //           ChangeNotifierProvider(
      //             create: (context) => LoginProvider(),
      //           ),
      //         ],
      //         child: const SignUpScreen(),
      //       ),
      //     );
      // // --------------------------- LoginScreen -------------------------------
      //   case ScreenName.loginScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => ChangeNotifierProvider(
      //         create: (context) => LoginProvider(),
      //         child: const LoginScreen(),
      //       ),
      //     );
      // // --------------------------- HomeScreen --------------------------------
      case ScreenName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: sl<HomeProvider>(),
            child: HomeScreen(),
          ),
        );
      // // --------------------------- ReSetPasswordScreen -----------------------
      //   case ScreenName.reSetPasswordScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => ChangeNotifierProvider(
      //           create: (context) => LoginProvider(),
      //           child: ReSetPasswordScreen()),
      //     );
      // // --------------------------- CheckEmailScreen --------------------------
      //   case ScreenName.checkEmailScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => const CheckEmailScreen(),
      //     );
      // // --------------------------- CreateNewPassword -------------------------
      //   case ScreenName.createNewPasswordScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => CreateNewPasswordScreen(),
      //     );
      // // ------------------------------ BNBUser --------------------------------
      //   case ScreenName.BNBUser:
      //     return MaterialPageRoute(
      //       builder: (_) => MultiProvider(
      //         providers: [
      //           ChangeNotifierProvider.value(value: sl<TrainingProvider>()),
      //           ChangeNotifierProvider.value(value: sl<ProfileProvider>())
      //         ],
      //         child: const BNBUser(),
      //       ),
      //     );
      // // ------------------------------ QrScreen -------------------------------
      // // case ScreenName.qrScreen:
      // //   return MaterialPageRoute(
      // //     builder: (_) => const ScannerScreen(),
      // //   );
      // // --------------------------- UpdateProfileScreen ------------------------
      //   case ScreenName.updateProfileScreen:
      //     var userData = settings.arguments as UserModel;
      //     return MaterialPageRoute(
      //       builder: (_) => ChangeNotifierProvider(
      //           create: (context) => ProfileProvider(),
      //           child: UpdateProfileScreen(
      //             userData: userData,
      //           )),
      //     );
      // // --------------------------- ClassScreen -------------------------------
      // // case ScreenName.classScreen:
      // //   return MaterialPageRoute(
      // //     builder: (_) => const ClassScreen(),
      // //   );
      // // ----------------------- ClassDetailsScreen ----------------------------
      // // case ScreenName.classDetailsScreen:
      // //   return MaterialPageRoute(
      // //     builder: (_) => const ClassDetailsScreen(),
      // //   );
      //
      // // ---------------------- AllCategoryScreen ------------------------------
      //   case ScreenName.allCategoryScreen:
      //     var categoryList = settings.arguments as List<CategoryModel>;
      //     return MaterialPageRoute(
      //       builder: (_) => CategoryScreen(
      //         categoryList: categoryList,
      //       ),
      //     );
      // // -------------------------- FullExercisesScreen ------------------------
      //   case ScreenName.fullExercisesScreen:
      //     var categoryList = settings.arguments as String;
      //     return MaterialPageRoute(
      //       builder: (_) => FullExercisesScreen(
      //         categoryId: categoryList,
      //       ),
      //     );
      //
      // // ----------------------- exercisesDetailsScreen ------------------------
      //   case ScreenName.exercisesDetailsScreen:
      //     var exerciseModel = settings.arguments as ExerciseModel;
      //     return MaterialPageRoute(
      //       builder: (_) => ExerciseDetails(
      //         exerciseModel: exerciseModel,
      //       ),
      //     );
      //
      // // --------------------------- startTraining -----------------------------
      //   case ScreenName.startTraining:
      //     var exerciseModel = settings.arguments as ExerciseModel;
      //     return MaterialPageRoute(
      //       builder: (_) => StartTraining(
      //         exerciseModel: exerciseModel,
      //       ),
      //     );
      // // --------------------- TermsAndConditionsScreen ------------------------
      //   case ScreenName.termsAndConditionsScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => TermsAndConditionsScreen(),
      //     );
      // // ------------------------- FAQScreen -----------------------------------
      //   case ScreenName.fAQScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => FAQScreen(),
      //     );
      // // ------------------------- NotificationSettingScreen --------------------
      //   case ScreenName.notificationSettingScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => NotificationSettingScreen(),
      //     );
      // // ------------------------- LanguageScreen ------------------------------
      //   case ScreenName.languageScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => LanguageScreen(),
      //     );
      // // ------------------------- ComingSoonScreen ----------------------------
      //   case ScreenName.comingSoonScreen:
      //     var title = settings.arguments as bool;
      //     return MaterialPageRoute(
      //       builder: (_) => ComingSoonScreen(
      //         isMemberShipScreen: title,
      //       ),
      //     );
      // // ------------------------- NotificationScreen ---------------------------
      //   case ScreenName.notificationScreen:
      //     return MaterialPageRoute(
      //       builder: (_) => NotificationScreen(),
      //     );
      // // ---------------------------- See All  ---------------------------------
      //   case ScreenName.seeAllScreen:
      //     var id = settings.arguments as String;
      //     return MaterialPageRoute(
      //       builder: (_) => SeeAllExercisesScreen(goalId: id),
      //     );
      // // ------------------------- MealPlanDetails -----------------------------
      //   case ScreenName.mealPlanDetails:
      //     var mealPlan = settings.arguments as MealPlan;
      //     return MaterialPageRoute(
      //       builder: (_) => MealPlanDetails(mealPlan: mealPlan),
      //     );
      // // ------------------------- ArticlesDetailsScreen -----------------------------
      //   case ScreenName.articlesDetailsScreen:
      //     var articlesObject = settings.arguments as ArticlesModel;
      //     return MaterialPageRoute(
      //       builder: (_) => ArticlesDetailsScreen(articles: articlesObject,),
      //     );

      default:
        result = const Scaffold(
          body: Center(
            child: Text(
              'Wrong path',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}

class ScreenArguments {
  final String title;
  final int id;

  ScreenArguments({required this.title, required this.id});
}
