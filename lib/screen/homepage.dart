import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';
import 'package:news_app_flutter/screen/newspage.dart';
import 'package:news_app_flutter/service/data_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmobile.twitter.com%2Fptpp_id&psig=AOvVaw0LVUSrs1vQ8Ak__6gwFxff&ust=1649390883219000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKi-0oSKgfcCFQAAAAAdAAAAABAD'),
            ),
          ),
          width: 10,
          margin: const EdgeInsets.all(5),
        ),
        title: const Text(
          'Good Morning',
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark),
            color: Colors.blue,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshoot) => snapshoot.data != null
        ? NewsPage(snapshoot.data as List<Article>)
        : const Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
