import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter goRouter;

AppRouter(this.goRouter);

  void goTo(String path, {Object? object}) {
    goRouter.go(path, extra: object);
  }

  void goToAndRemove(String path, {Object? object}) {
    goRouter.goNamed(path, extra: object);
  }

  void back([dynamic result]) {
    goRouter.pop(result);
  }

  // void mayBack() {
  //   goRouter.me();
  // }

  void removeAllBack(String path) {
    goRouter.goNamed(path, extra: null);
  }
}
