import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';
import 'package:news_app_flutter/utils/utils.dart';
import 'package:news_app_flutter/widget/carousel_widget.dart';
import 'package:news_app_flutter/widget/tab_menu.dart';

class NewsPage extends StatefulWidget {
  final List<Article> article;
  NewsPage(this.article);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Breaking News',
              style: titleHome,
            ),
          ),
          CarouselWidget(widget.article),
          TabBarMenu(widget.article),
        ],
      ),
    );
  }
}
