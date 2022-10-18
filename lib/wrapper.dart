import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:exapmles/helpers/colored_console_print.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);
  final List<String> pageNames = RouteName.pageNames;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              "Hello".printf();
              "Hello".error();
              "Hello".log();
            },
            icon: const Icon(Icons.print))
      ]),
      body: ListView.separated(
        padding: const EdgeInsets.all(30),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, __) {
          return ElevatedButton(
              key: Key(pageNames[__]),
              onPressed: () {
                NavigatorService.pushNamed(pageNames[__]);
              },
              child: Text(pageNames[__]));
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
        itemCount: pageNames.length,
      ),
    );
  }
}
