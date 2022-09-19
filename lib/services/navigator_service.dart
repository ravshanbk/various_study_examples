import 'package:flutter/material.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  static void pushNamed(String route, {Object? args}) {
    navigationKey.currentState!.pushNamed(route, arguments: args);
  }

  static void pushReplacementNamed(String routeName) {
    navigationKey.currentState!.pushReplacementNamed(routeName);
  }

  static void pushNamedAndRemoveUntil(String routeName) {
    navigationKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  static void pop() {
    if (navigationKey.currentState!.canPop()) {
      navigationKey.currentState!.pop();
    }
  }
}
