// // import 'package:exapmles/test/unit_test/models/article_model.dart';
// import 'package:exapmles/test/unit_test/models/article_model.dart';
// import 'package:exapmles/test/unit_test/provider/news_provider.dart';
// import 'package:exapmles/test/unit_test/service/news_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';



// class MockNewsService extends Mock implements NewsService {}

// void main() {
//   late NewsChangeNotifier sut;
//   late MockNewsService mockNewsService;
//   setUp(() {
//     mockNewsService = MockNewsService();
//     sut = NewsChangeNotifier(mockNewsService);
//   });

//   test("initial values are correct", () {
//     expect(sut.articles, []);
//     expect(sut.isLoading, false);
//   });
//   group(
//     'getArticles',
//     () {
//       final articlesFromService = [
//         Article(title: "Test 1", content: "Test 1 content"),
//         Article(title: "Test 2", content: "Test 2 content"),
//         Article(title: "Test 3", content: "Test 3 content"),
//       ];
//       void arrangeNewsServiceReturn3Articles() {
//         when(() => mockNewsService.getArticles()).thenAnswer(
//           (invocation) async => articlesFromService,
//         );
//       }

//       test(
//         "gets article usin the newsService",
//         () async {
//           arrangeNewsServiceReturn3Articles();
//           await sut.getArticles();
//           verify(() => mockNewsService.getArticles()).called(1);
//         },
//       );
//       test(
//         """indicates loading of data,
// sets articles to the ones from the service,
// indicates that datais not being loadid anymore""",
//         () async {
//           arrangeNewsServiceReturn3Articles();
//           final future = sut.getArticles();
//           expect(sut.isLoading, true);
//           await future;
//           expect(sut.articles, articlesFromService);
//           expect(sut.isLoading, false);
//         },
//       );
//     },
//   );
// }
