import 'package:flutter/cupertino.dart';

class RouterNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> navigateToScreen<T>({required Widget page}) async {
    return await navigatorKey.currentState?.push<T>(
      CupertinoPageRoute(
        builder: (context) {
          return page;
        }
      ),
    );
  }
}