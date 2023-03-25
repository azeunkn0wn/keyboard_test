import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_test/inherited.dart';
import 'package:keyboard_test/kb_painter.dart';

import 'model/keyboard_model.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  late KeyboardPainter painter;
  late Size size;
  late List<MyKeyboardKey> keyboardKeyDataList;

  @override
  void initState() {
    keyboardKeyDataList = [];

    for (var keyboardKey in keyboardData) {
      keyboardKeyDataList.add(MyKeyboardKey.fromMap(keyboardKey));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int pressedCount = KeyboardService.of(context)!.keymap.length;

    List<PhysicalKeyboardKey> pressed = KeyboardService.of(context)!.pressed;

    // setState(() {
    size = Size(MediaQuery.of(context).size.width,
        (MediaQuery.of(context).size.width * 0.2816728167281673));

    painter = KeyboardPainter(
        keysData: keyboardKeyDataList,
        pressedCount: pressedCount,
        pressedKeys: pressed);
    // });
    return Container(
      color: Colors.grey,
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 813 / 229,
        child: CustomPaint(
          willChange: true,
          size: size,
          painter: painter,
        ),
      ),
    );
  }
}

const List keyboardData = [
  {
    "usbHidUsage": 458805,
    "debugName": "Backquote",
    "location": {"x": 0.02337, "y": 0.288209},
    "keyType": null
  },
  {
    "usbHidUsage": 458782,
    "debugName": "Digit 1",
    "location": {"x": 0.062727, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458783,
    "debugName": "Digit 2",
    "location": {"x": 0.100873, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458784,
    "debugName": "Digit 3",
    "location": {"x": 0.141449, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458785,
    "debugName": "Digit 4",
    "location": {"x": 0.180812, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458786,
    "debugName": "Digit 5",
    "location": {"x": 0.220327, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458787,
    "debugName": "Digit 6",
    "location": {"x": 0.259531, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458788,
    "debugName": "Digit 7",
    "location": {"x": 0.29889, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458789,
    "debugName": "Digit 8",
    "location": {"x": 0.338411, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458790,
    "debugName": "Digit 9",
    "location": {"x": 0.377616, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458791,
    "debugName": "Digit 0",
    "location": {"x": 0.41697, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458797,
    "debugName": "Minus",
    "location": {"x": 0.456489, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458798,
    "debugName": "Equal",
    "location": {"x": 0.494473, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458801,
    "debugName": "Backslash",
    "location": {"x": 0.533834, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458772,
    "debugName": "Key Q",
    "location": {"x": 0.087489, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458778,
    "debugName": "Key W",
    "location": {"x": 0.12669, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458760,
    "debugName": "Key E",
    "location": {"x": 0.166051, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458773,
    "debugName": "Key R",
    "location": {"x": 0.205567, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458775,
    "debugName": "Key T",
    "location": {"x": 0.243553, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458780,
    "debugName": "Key Y",
    "location": {"x": 0.28291, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458776,
    "debugName": "Key U",
    "location": {"x": 0.322272, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458764,
    "debugName": "Key I",
    "location": {"x": 0.361632, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458770,
    "debugName": "Key O",
    "location": {"x": 0.400996, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458771,
    "debugName": "Key P",
    "location": {"x": 0.440356, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458799,
    "debugName": "Bracket Left",
    "location": {"x": 0.479831, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458800,
    "debugName": "Bracket Right",
    "location": {"x": 0.519075, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458756,
    "debugName": "Key A",
    "location": {"x": 0.098558, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458774,
    "debugName": "Key S",
    "location": {"x": 0.137765, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458759,
    "debugName": "Key D",
    "location": {"x": 0.177122, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458761,
    "debugName": "Key F",
    "location": {"x": 0.216639, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458762,
    "debugName": "Key G",
    "location": {"x": 0.255842, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458763,
    "debugName": "Key H",
    "location": {"x": 0.2952, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458765,
    "debugName": "Key J",
    "location": {"x": 0.334718, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458766,
    "debugName": "Key K",
    "location": {"x": 0.37392, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458767,
    "debugName": "Key L",
    "location": {"x": 0.413283, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458803,
    "debugName": "Semicolon",
    "location": {"x": 0.452648, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458804,
    "debugName": "Quote",
    "location": {"x": 0.492005, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458781,
    "debugName": "Key Z",
    "location": {"x": 0.110709, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458779,
    "debugName": "Key X",
    "location": {"x": 0.150074, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458758,
    "debugName": "Key C",
    "location": {"x": 0.189431, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458757,
    "debugName": "Key B",
    "location": {"x": 0.26953, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458769,
    "debugName": "Key N",
    "location": {"x": 0.308893, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458768,
    "debugName": "Key M",
    "location": {"x": 0.348423, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458806,
    "debugName": "Comma",
    "location": {"x": 0.387615, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458807,
    "debugName": "Period",
    "location": {"x": 0.426968, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458808,
    "debugName": "Slash",
    "location": {"x": 0.466505, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458777,
    "debugName": "Key V",
    "location": {"x": 0.227476, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458810,
    "debugName": "F1",
    "location": {"x": 0.103333, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458811,
    "debugName": "F2",
    "location": {"x": 0.143909, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458812,
    "debugName": "F3",
    "location": {"x": 0.183272, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458813,
    "debugName": "F4",
    "location": {"x": 0.222787, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458814,
    "debugName": "F5",
    "location": {"x": 0.280599, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458815,
    "debugName": "F6",
    "location": {"x": 0.319963, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458816,
    "debugName": "F7",
    "location": {"x": 0.358058, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458817,
    "debugName": "F8",
    "location": {"x": 0.398684, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458818,
    "debugName": "F9",
    "location": {"x": 0.456489, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458819,
    "debugName": "F10",
    "location": {"x": 0.49585, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458820,
    "debugName": "F11",
    "location": {"x": 0.53521, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458821,
    "debugName": "F12",
    "location": {"x": 0.574573, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458825,
    "debugName": "Insert",
    "location": {"x": 0.664364, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458826,
    "debugName": "Home",
    "location": {"x": 0.703725, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458827,
    "debugName": "Page Up",
    "location": {"x": 0.743261, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458828,
    "debugName": "Delete",
    "location": {"x": 0.664364, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458829,
    "debugName": "End",
    "location": {"x": 0.703725, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458830,
    "debugName": "Page Down",
    "location": {"x": 0.743261, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458822,
    "debugName": "Print Screen",
    "location": {"x": 0.664209, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458823,
    "debugName": "Scroll Lock",
    "location": {"x": 0.703562, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458824,
    "debugName": "Pause",
    "location": {"x": 0.743082, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458832,
    "debugName": "Arrow Left",
    "location": {"x": 0.664364, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458833,
    "debugName": "Arrow Down",
    "location": {"x": 0.703725, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458831,
    "debugName": "Arrow Right",
    "location": {"x": 0.743261, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458834,
    "debugName": "Arrow Up",
    "location": {"x": 0.703725, "y": 0.663755},
    "keyType": null
  },
  {
    "usbHidUsage": 458835,
    "debugName": "Num Lock",
    "location": {"x": 0.821647, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458836,
    "debugName": "Numpad Divide",
    "location": {"x": 0.861166, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458837,
    "debugName": "Numpad Multiply",
    "location": {"x": 0.900364, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458847,
    "debugName": "Numpad 7",
    "location": {"x": 0.821647, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458848,
    "debugName": "Numpad 8",
    "location": {"x": 0.861166, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458849,
    "debugName": "Numpad 9",
    "location": {"x": 0.900364, "y": 0.414847},
    "keyType": null
  },
  {
    "usbHidUsage": 458844,
    "debugName": "Numpad 4",
    "location": {"x": 0.821647, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458845,
    "debugName": "Numpad 5",
    "location": {"x": 0.861166, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458846,
    "debugName": "Numpad 6",
    "location": {"x": 0.900364, "y": 0.541485},
    "keyType": null
  },
  {
    "usbHidUsage": 458841,
    "debugName": "Numpad 1",
    "location": {"x": 0.821647, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458842,
    "debugName": "Numpad 2",
    "location": {"x": 0.861166, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458843,
    "debugName": "Numpad 3",
    "location": {"x": 0.900364, "y": 0.668122},
    "keyType": null
  },
  {
    "usbHidUsage": 458851,
    "debugName": "Numpad Decimal",
    "location": {"x": 0.900364, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458838,
    "debugName": "Numpad Subtract",
    "location": {"x": 0.939725, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458839,
    "debugName": "Numpad Add",
    "location": {"x": 0.970194, "y": 0.429505},
    "keyType": null
  },
  {
    "usbHidUsage": 458840,
    "debugName": "Numpad Enter",
    "location": {"x": 0.970194, "y": 0.691332},
    "keyType": null
  },
  {
    "usbHidUsage": 458850,
    "debugName": "Numpad 0",
    "location": {"x": 0.821698, "y": 0.908297},
    "keyType": null
  },
  {
    "usbHidUsage": 458794,
    "debugName": "Backspace",
    "location": {"x": 0.573197, "y": 0.28821},
    "keyType": null
  },
  {
    "usbHidUsage": 458793,
    "debugName": "Escape",
    "location": {"x": 0.02337, "y": 0.082969},
    "keyType": null
  },
  {
    "usbHidUsage": 458796,
    "debugName": "Space",
    "location": {"x": 0.185245, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458983,
    "debugName": "Meta Right",
    "location": {"x": 0.477575, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458853,
    "debugName": "Context Menu",
    "location": {"x": 0.516762, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458795,
    "debugName": "Tab",
    "location": {"x": 0.023422, "y": 0.528384},
    "keyType": null
  },
  {
    "usbHidUsage": 458809,
    "debugName": "Caps Lock",
    "location": {"x": 0.023441, "y": 0.655022},
    "keyType": null
  },
  {
    "usbHidUsage": 458981,
    "debugName": "Shift Right",
    "location": {"x": 0.50421, "y": 0.781659},
    "keyType": null
  },
  {
    "usbHidUsage": 458792,
    "debugName": "Enter",
    "location": {"x": 0.552402, "y": 0.542288},
    "keyType": null
  },
  {
    "usbHidUsage": 458980,
    "debugName": "Control Right",
    "location": {"x": 0.556061, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458977,
    "debugName": "Shift Left",
    "location": {"x": 0.023443, "y": 0.781659},
    "keyType": null
  },
  {
    "usbHidUsage": 458976,
    "debugName": "Control Left",
    "location": {"x": 0.023614, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458979,
    "debugName": "Meta Left",
    "location": {"x": 0.077649, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458978,
    "debugName": "Alt Left",
    "location": {"x": 0.11627, "y": 0.79476},
    "keyType": null
  },
  {
    "usbHidUsage": 458982,
    "debugName": "Alt Right",
    "location": {"x": 0.436368, "y": 0.79476},
    "keyType": null
  }
];
