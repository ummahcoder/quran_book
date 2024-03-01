import 'package:flutter/widgets.dart';

import '../local/local_controller.dart';

@immutable
class InheritedLocalNotifier extends InheritedNotifier<LocaleController> {
  const InheritedLocalNotifier({
    required final LocaleController localController,
    required super.child,
    super.key,
  }) : super(
          notifier: localController,
        );

  static LocaleController? maybeOf(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<InheritedLocalNotifier>()
          ?.notifier;
    } else {
      final inhW = context
          .getElementForInheritedWidgetOfExactType<InheritedLocalNotifier>()
          ?.widget;
      return inhW is InheritedLocalNotifier ? inhW.notifier : null;
    }
  }
}
