import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_test/inherited.dart';
import 'package:keyboard_test/keyboard.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String printKeyPress(value) {
    String upOrDown = value.runtimeType == RawKeyDownEvent ? '↓' : '↑';

    final String output = '$upOrDown ${value.logicalKey.keyLabel}';

    return output;
  }

  late String keyPress;
  late int pressedKeyCount;
  final TextEditingController _controller = TextEditingController();

  Map pressedKey = {};
  List<PhysicalKeyboardKey> pressed = [];
  int pressedCount = 0;
  final _focusNode = FocusNode();
  late Map keymap;

  @override
  void initState() {
    keyPress = '';
    pressedKeyCount = 0;
    keymap = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardService(
      keymap: keymap,
      pressed: pressed,
      pressedCount: pressedCount,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (value) {
          final int usbHidUsage = value.data.physicalKey.usbHidUsage;
          final debugName = value.data.physicalKey.debugName;

          Map map = {
            value.data.physicalKey.usbHidUsage: {
              'debugName': debugName,
              'pressedCount': pressedCount
            }
          };

          // if (value.runtimeType == RawKeyDownEvent) {
          //   String pathName = ("path_${keymap.length + 1}");
          //   Map keym = {
          //     pathName: {'usbHidUsage': usbHidUsage, 'debugName': debugName},
          //   };

          //   keymap.addAll(keym);
          //   print(keymap);
          // }

          pressedKey.addAll(map);

          String keyString = '';

          pressedKey.forEach((key, value) {
            keyString += '${value['debugName']} : ${value['pressedCount']}\n';
          });

          setState(() {
            if (!pressed.contains(value.data.physicalKey)) {
              pressed.add(value.data.physicalKey);
            }

            pressedCount = pressedKey.containsKey(usbHidUsage)
                ? (value.runtimeType == RawKeyDownEvent && !value.repeat
                    ? pressedKey[usbHidUsage]['pressedCount'] + 1
                    : pressedKey[usbHidUsage]['pressedCount'])
                : 1;
            keyPress = printKeyPress(value);
            _controller.text = keyString;
            pressedKeyCount = pressedKey.length;
            _controller.selection =
                TextSelection.collapsed(offset: _controller.text.length);
          });
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        enabled: false,
                        autofocus: true,
                        controller: _controller,
                        // expands: true,
                        minLines: 1,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(keyPress),
                          Text(pressedKeyCount.toString()),
                          ElevatedButton(
                            onPressed: () async {
                              // String result = jsonEncode(keymap);
                              // await File("keyMap.json").writeAsString(result);
                            },
                            child: const Text("done"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Keyboard(),
              ],
            ),
          ),

          // Container(
          //   alignment: Alignment.topCenter,
          //   child: AspectRatio(
          //     aspectRatio: 1 / 1,
          //     child: CustomPaint(
          //       size: Size(36, 33),
          //       painter: RPSCustomPainter(),
          //     ),
          //   ),
          // ),
          // //     CustomPaint(
          // //   size: Size(                MediaQuery.of(context).size.width,                (MediaQuery.of(context).size.width * 0.237006237006237)                    .toDouble()),
          // //   painter: RPSCustomPainter(),
          // // ),
        ),
      ),
    );
  }
}
