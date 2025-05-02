import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter goRouter;

  AppRouter(this.goRouter);

  /// Navigiere zu einem Pfad (z. B. '/home')
  void goTo(String path, {Object? extra}) {
    goRouter.go(path, extra: extra);
  }

  /// Navigiere zu einem benannten Ziel (z. B. 'home'), ersetzt aktuellen Stack
  void goToNamed(String name, {Object? extra}) {
    goRouter.goNamed(name, extra: extra);
  }

  /// Entfernt alle vorherigen Routen und geht zu einer benannten Route
  void removeAllAndGo(String name, {Object? extra}) {
    goRouter.goNamed(name, extra: extra);
  }

  /// Gehe zurück, optional mit Ergebnis
  void back<T extends Object?>([T? result]) {
    goRouter.pop(result);
  }

  /// Prüfe, ob zurückgegangen werden kann, und gehe ggf. zurück
  void maybeBack<T extends Object?>([T? result]) {
    if (goRouter.canPop()) {
      goRouter.pop(result);
    }
  }
}
