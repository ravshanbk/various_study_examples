import 'package:flutter/material.dart';

class PushPopSecondPage extends StatelessWidget {
  PushPopSecondPage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop(controller.text);
        },
        icon: const Icon(Icons.arrow_back),
      )),
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: controller,
          )
        ],
      )),
    );
  }
}
