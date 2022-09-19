import 'package:exapmles/other_pages/objectbox_exapmple/obj_home_page.dart';
import 'package:exapmles/routes/app_routes.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorService.navigationKey,
      initialRoute: RouteName.WRAPPER,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: "Material App",
      debugShowCheckedModeBanner: false,
    );
  }
}
