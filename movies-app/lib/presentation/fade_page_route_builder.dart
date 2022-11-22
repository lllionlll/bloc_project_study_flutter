import 'package:flutter/cupertino.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder widgetBuilder;
  final RouteSettings setting;
  FadePageRouteBuilder({
    required this.widgetBuilder,
    required this.setting,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              widgetBuilder(context),
          settings: setting,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 0.1).chain(CurveTween(curve: curve));
            return FadeTransition(opacity: animation.drive(tween));
          },
          transitionDuration: const Duration(microseconds: 500),
        );
}
