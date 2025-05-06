import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:trustedtallentsvalley/routs/app_router.dart';

import 'fetures/Home/Providers/home_provider.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // Registering the services and dependencies

  // Registering AppRouter
  sl.registerLazySingleton<AppRouter>(() => AppRouter());

  // Registering Firebase services
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Registering providers
  sl.registerLazySingleton<HomeProvider>(() => HomeProvider());

  // Add any other services or providers as needed
}
