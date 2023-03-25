import 'package:flutter/material.dart';

import 'model/keyboard_model.dart';

//Copy this CustomPainter code to the Bottom of the File
class KeyboardPainter extends CustomPainter {
  int pressedCount;
  List pressedKeys;
  List<MyKeyboardKey> keysData;

  KeyboardPainter(
      {required this.pressedCount,
      required this.pressedKeys,
      required this.keysData,
      r});

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundFill = Paint()..style = PaintingStyle.fill;
    backgroundFill.color = const Color(0xffD9D9D9).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundFill);

    for (MyKeyboardKey keyboardKey in keysData) {
      if (pressedKeys.contains(keyboardKey.physicalKey)) {
        keyboardKey.pressed();
      }

      Path path = keyboardKey.getPath(size);

      Paint paintStroke = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      paintStroke.color = keyboardKey.strokeColor;
      paintStroke.strokeCap = StrokeCap.round;
      canvas.drawPath(path, paintStroke);

      Paint paintFill = Paint()..style = PaintingStyle.fill;
      paintFill.color = keyboardKey.fillColor;
      canvas.drawPath(path, paintFill);
    }
  }
}
