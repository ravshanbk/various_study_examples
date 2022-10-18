import 'package:flutter/material.dart';

class EditibleTextWidgetPage extends StatefulWidget {
 const  EditibleTextWidgetPage({Key? key}) : super(key: key);

  @override
  State<EditibleTextWidgetPage> createState() => _EditibleTextWidgetPageState();
}

class _EditibleTextWidgetPageState extends State<EditibleTextWidgetPage> {
  TextEditingController controller = TextEditingController(text: "Eitible text");

  FocusNode focusNode = FocusNode();

  TextStyle textStyle = const TextStyle(
      color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.orangeAccent,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EditableText(
              controller: controller,
              focusNode: focusNode,
              style: textStyle,
              cursorColor: Colors.white,
              backgroundCursorColor: Colors.black,textAlign: TextAlign.center,),
        ],
      )),
    );
  }
}
