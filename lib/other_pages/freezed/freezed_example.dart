import 'package:exapmles/models/my_class.dart';
import 'package:flutter/material.dart';

class FreezedExamplePage extends StatelessWidget {
  final MyClass myClass;
  const FreezedExamplePage({Key? key,required this.myClass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Freezed"),
      ),
      body: Column(children: [Text("My Class id: ${myClass.id} / ${myClass.balance} / ${myClass.name}")]),
    );
  }
}
