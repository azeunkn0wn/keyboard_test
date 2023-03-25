import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardService extends InheritedWidget {
  @override
  final Widget child;
  final List<PhysicalKeyboardKey> pressed;
  final int pressedCount;
  final Map keymap;
  const KeyboardService(
      {Key? key,
      required this.child,
      required this.pressed,
      required this.pressedCount,
      required this.keymap})
      : super(key: key, child: child);

  static KeyboardService? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KeyboardService>();
  }

  @override
  bool updateShouldNotify(KeyboardService oldWidget) {
    return true;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty('pressedDown', pressed));
    properties.add(IntProperty('pressedCount', pressedCount));
    super.debugFillProperties(properties);
  }
}
