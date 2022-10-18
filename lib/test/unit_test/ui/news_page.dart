import 'package:exapmles/test/unit_test/provider/news_provider.dart';
import 'package:exapmles/test/unit_test/ui/article_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<NewsChangeNotifier>().getArticles();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("News"),
        centerTitle: true,
      ),
      body: Consumer<NewsChangeNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(key: Key("progress-indicator"),),
            );
          }
          return ColoredBox(
            color: Colors.orangeAccent,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  itemCount: notifier.articles.length,
                  itemBuilder: (_, __) {
                    final article = notifier.articles[__];
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ArticlePage(article: article),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(article.title),
                          subtitle: Text(
                            article.content,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
