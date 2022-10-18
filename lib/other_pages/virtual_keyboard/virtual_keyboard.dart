import 'package:flutter/material.dart';
import 'package:virtual_keyboard_flutter/virtual_keyboard_flutter.dart';

class VirtualKeyboardPage extends StatefulWidget {
  const VirtualKeyboardPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _VirtualKeyboardPageState createState() => _VirtualKeyboardPageState();
}

class _VirtualKeyboardPageState extends State<VirtualKeyboardPage> {
  // Holds the text that user typed.
  String text = '';

  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;

  late TextEditingController _controllerText;

  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _controllerText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your text',
                  ),
                )),
            SwitchListTile(
              title: Text(
                'Keyboard Type = ${isNumericMode ? 'VirtualKeyboardType.Numeric' : 'VirtualKeyboardType.Alphanumeric'}',
              ),
              value: isNumericMode,
              onChanged: (val) {
                setState(() {
                  isNumericMode = val;
                });
              },
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.deepPurple,
              child: VirtualKeyboard(
               
                fontSize: 33,
                alwaysCaps: true,
                key: const Key("fasgadf"),

                
                height: 300,
                textColor: Colors.white,
                type: isNumericMode
                    ? VirtualKeyboardType.Numeric
                    : VirtualKeyboardType.Alphanumeric,
                textController: _controllerText,
                defaultLayouts: const [
                  
                  VirtualKeyboardDefaultLayouts.Cyrillic,

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
