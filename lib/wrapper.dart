import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  final List<String> pageNames = const [
    RouteName.BARCODESCANNER,
    RouteName.CLIPPER,
    RouteName.OBJECTBOX,
    RouteName.SHELL,
    RouteName.SLIDER,
    RouteName.SOCKET_IO,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, __) {
          return ElevatedButton(
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
