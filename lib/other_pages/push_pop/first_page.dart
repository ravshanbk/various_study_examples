import 'package:exapmles/helpers/colored_console_print.dart';
import 'package:exapmles/other_pages/push_pop/second_page.dart';
import 'package:flutter/material.dart';

class PushPopExampleFirstPage extends StatelessWidget {
  const PushPopExampleFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PushPopSecondPage()))
              .then((value) => value.toString().printf("result"));
        },
        child: Text("Go"),
      )),
    );
  }
}
