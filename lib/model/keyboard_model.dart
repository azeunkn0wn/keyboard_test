import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MyKeyboardKey extends Equatable {
  final PhysicalKeyboardKey physicalKey;
  final Offset keyLocation;
  MyKeyboardKey({
    required this.physicalKey,
    required this.keyLocation,
  });

  String? get label => physicalKey.debugName;

  //! TODO: should not be in here
  bool _isPressed = false;
  void pressed() {
    _isPressed = true;
  }

  bool get isPressedDown =>
      HardwareKeyboard.instance.physicalKeysPressed.contains(physicalKey);

  Color get fillColor {
    Color active = const Color.fromARGB(255, 54, 117, 5);
    Color inactive = const Color.fromARGB(255, 166, 166, 166);

    return isPressedDown ? active : inactive;
  }

  Color get strokeColor {
    Color pressedColor = const Color.fromARGB(255, 115, 172, 72);
    Color notPressedColor = const Color.fromARGB(255, 0, 0, 0);

    return _isPressed ? pressedColor : notPressedColor;
  }

  Path getPath(Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width * 0.005205621, size.height * 0.004366812);
    path_1.lineTo(size.width * 0.03169754, size.height * 0.004366812);
    path_1.cubicTo(
        size.width * 0.03302460,
        size.height * 0.004366812,
        size.width * 0.03567036,
        size.height * 0.009298865,
        size.width * 0.03567036,
        size.height * 0.01918362);
    path_1.lineTo(size.width * 0.03567036, size.height * 0.1030904);
    path_1.cubicTo(
        size.width * 0.03567036,
        size.height * 0.1129686,
        size.width * 0.03302460,
        size.height * 0.1179039,
        size.width * 0.03169754,
        size.height * 0.1179039);
    path_1.lineTo(size.width * 0.005205621, size.height * 0.1179039);
    path_1.cubicTo(
        size.width * 0.002554280,
        size.height * 0.1179039,
        size.width * 0.001230012,
        size.height * 0.1129686,
        size.width * 0.001230012,
        size.height * 0.1030904);
    path_1.lineTo(size.width * 0.001230012, size.height * 0.01918362);
    path_1.cubicTo(
        size.width * 0.001230012,
        size.height * 0.009298865,
        size.width * 0.002554280,
        size.height * 0.004366812,
        size.width * 0.005205621,
        size.height * 0.004366812);
    path_1.close();

    return path_1.shift(
        Offset(keyLocation.dx * size.width, keyLocation.dy * size.height));
  }

  @override
  String toString() =>
      'KeyboardKeyData(physicalKey: $physicalKey, isPressed: $_isPressed, location: $keyLocation)';

  factory MyKeyboardKey.fromMap(Map<String, dynamic> map) {
    return MyKeyboardKey(
      physicalKey: PhysicalKeyboardKey(map['usbHidUsage']),
      keyLocation: Offset(map['location']['x'], map['location']['y']),
    );
  }
  @override
  List<Object> get props => [physicalKey];
}
