// import 'package:exapmles/test/unit_test/models/article_model.dart';
// import 'package:exapmles/test/unit_test/provider/news_provider.dart';
// import 'package:exapmles/test/unit_test/service/news_service.dart';
// import 'package:exapmles/test/unit_test/ui/news_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:provider/provider.dart';

// class MockNewsService extends Mock implements NewsService {}

// void main() {
//   late MockNewsService mockNewsService;
//   setUp(() {
//     mockNewsService = MockNewsService();
//   });

//   final articlesFromService = [
//     Article(title: "Test 1", content: "Test 1 content"),
//     Article(title: "Test 2", content: "Test 2 content"),
//     Article(title: "Test 3", content: "Test 3 content"),
//   ];

//   void arrangeNewsServiceReturn3Articles() {
//     when(() => mockNewsService.getArticles()).thenAnswer(
//       (invocation) async => articlesFromService,
//     );
//   }

//   void arrangeNewsServiceReturn3ArticlesAfter2Seconds() {
//     when(() => mockNewsService.getArticles()).thenAnswer(
//       (invocation) async {
//         await Future.delayed(const Duration(seconds: 2));
//         return articlesFromService;
//       },
//     );
//   }

//   Widget createWidgetUnderTest() {
//     return MaterialApp(
//       title: 'News App',
//       home: ChangeNotifierProvider(
//         create: (_) => NewsChangeNotifier(
//           mockNewsService,
//         ),
//         child: const NewsPage(),
//       ),
//     );
//   }

//   testWidgets(
//     "title is displayed",
//     (WidgetTester tester) async {
//       arrangeNewsServiceReturn3Articles();
//       await tester.pumpWidget(createWidgetUnderTest());
//       expect(find.text("News"), findsOneWidget);
//     },
//   );
//   testWidgets(
//     'loading indicator is displaying while waiting for articles ',
//     (WidgetTester tester) async {
//       arrangeNewsServiceReturn3ArticlesAfter2Seconds();

//       await tester.pumpWidget(createWidgetUnderTest());
//       await tester.pump(const Duration(milliseconds: 500));

//       expect(find.byKey(const Key("progress-indicator")), findsOneWidget);

//       await tester.pumpAndSettle();
//     },
//   );
//   testWidgets(
//     'articles are displayed',
//     (WidgetTester tester) async {
//       arrangeNewsServiceReturn3Articles();

//       await tester.pumpWidget(createWidgetUnderTest());

//       await tester.pump();

//       for (final article in articlesFromService) {
//         expect(find.text(article.title), findsOneWidget);
//         expect(find.text(article.content), findsOneWidget);
//       }
//     },
//   );
// }
