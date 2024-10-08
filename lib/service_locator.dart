import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trustedtallentsvalley/config/app_config.dart';
import 'package:trustedtallentsvalley/routs/app_router.dart';
import 'package:trustedtallentsvalley/routs/route_generator.dart';

import 'fetures /Home/Providers/home_provider.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:gym_app/feature/Training/providers/training_provider.dart';
// import 'package:gym_app/feature/profile/provider/profile_provider.dart';
// import 'package:gym_app/feature/registrations/provider/loginProvider.dart';
// import 'package:gym_app/feature/registrations/provider/signUpProvider.dart';
// import 'package:gym_app/logic/localData/shared_pref.dart';
// import 'package:gym_app/routes/app_router.dart';
// import 'package:gym_app/utils/app_config.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'feature/home_screen/providers/home_provider.dart';

var sl = GetIt.instance;

Future init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  // FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // sl.registerLazySingleton<SharedPrefController>(
  //     () => SharedPrefController(preferences: sl()));
  sl.registerLazySingleton<AppConfig>(() => AppConfig());
  sl.registerLazySingleton(() => AppRouter(router));

  // --------------------- Firebase --------------------------------------------
  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  sl.registerLazySingleton<FirebaseFirestore>(() => firebaseFireStore);
  // sl.registerLazySingleton<FirebaseStorage>(() => firebaseStorage);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // --------------------- Provider --------------------------------------------
  // sl.registerLazySingleton<ProfileProvider>(() => ProfileProvider());
  sl.registerLazySingleton<HomeProvider>(() => HomeProvider());
  // sl.registerLazySingleton<LoginProvider>(() => LoginProvider());
  // sl.registerLazySingleton<SignUpProvider>(() => SignUpProvider());
  // sl.registerLazySingleton<TrainingProvider>(() => TrainingProvider());
}
