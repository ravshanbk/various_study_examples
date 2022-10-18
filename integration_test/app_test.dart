// import 'package:exapmles/routes/rout_names.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:exapmles/main.dart' as app;

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets(
//     "Tap button",
//     (WidgetTester tester) async {
//       app.main();
//       await tester.pumpAndSettle();
//       List<String> keys = RouteName.pageNames;
//       for (int i = 0; i < keys.length; i++) {
//         final Finder button = find.byKey(Key(keys[i]));
//         await tester.tap(button);
//         await Future.delayed(const Duration(milliseconds: 500));
//         final Finder backButton = find.byIcon(Icons.arrow_back);
//  print("object $i");
//         await Future.delayed(const Duration(milliseconds: 500));
//         await tester.tap(backButton);
//         await tester.pumpAndSettle();
//       }

//       for (int i = 0; i < keys.length; i++) {
       
//         expect(find.byKey(Key(keys[i])), findsOneWidget);
//       }
//     },
//   );
// }
