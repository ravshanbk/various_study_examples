import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallBackShortCutsPage extends StatefulWidget {
  const CallBackShortCutsPage({Key? key}) : super(key: key);

  @override
  State<CallBackShortCutsPage> createState() => _CallBackShortCutsPageState();
}

bool isSpacePressed = false;
bool isMPressed = false;

class _CallBackShortCutsPageState extends State<CallBackShortCutsPage> {
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      key:const  Key("fasdfoiefjds;l"),
      bindings: {
        const SingleActivator(LogicalKeyboardKey.space): () {
          setState(() {
                  isSpacePressed =  !isSpacePressed;
                });
          print("=== That is space key ===");
        },
        const SingleActivator(LogicalKeyboardKey.keyM): () {
          setState(() {
                isMPressed = !isMPressed;
                });
          print("=== That is 'M' key ===");
        },
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Callback shortcuts "),
        ),
        body: Column(children: [
         
          Switch(
              value: isSpacePressed,
              onChanged: (v) {
                setState(() {
                  isSpacePressed = v;
                });
              }),
               Switch(
              value: isMPressed,
              onChanged: (v) {
                setState(() {
                  isMPressed = v;
                });
              })
        ]),
      ),
    );
  }
}
