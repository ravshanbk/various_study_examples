import 'package:exapmles/other_pages/objectbox_exapmple/box/my_object_box.dart';
import 'package:exapmles/routes/app_routes.dart';
import 'package:exapmles/routes/rout_names.dart';
import 'package:exapmles/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await initHiveForFlutter();
  await MyObjectbox.init();
  await PackageInfo.fromPlatform();
  runApp(const MyApp());
}

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
