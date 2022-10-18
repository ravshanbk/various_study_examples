import 'package:exapmles/test/unit_test/models/article_model.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({Key? key, required this.article}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 8,
          right: 8,
        ),
        child: Column(children: [
          Text(
            article.title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 8),
          Text(article.content),
        ]),
      ),
    );
  }
}
