import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';
import 'package:news_app_flutter/service/data_service.dart';
import 'package:news_app_flutter/widget/news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  TabBarMenu(this.article);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

// kita akan menggunakan SingleTickerProviderStateMixin jika kita mempunyai satu animasi
class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Business',
    ),
    const Tab(
      text: 'Entertainment',
    ),
    const Tab(
      text: 'General',
    ),
    const Tab(
      text: 'Health',
    ),
    const Tab(
      text: 'Science',
    ),
    const Tab(
      text: 'Sports',
    ),
    const Tab(
      text: 'Technology',
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(
      length: myTabs.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            tabs: myTabs,
            controller: _tabController,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BubbleTabIndicator(
              indicatorColor: Colors.black,
              indicatorHeight: 30,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            isScrollable: true,
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: TabBarView(
              children: myTabs.map((Tab tab) {
                //disini kita menggunakan future builder karena
                //kita bisa dengan mudah mendapatkan status dari proses
                //yang sedang kita jalankan, misalnya seperti
                //menampilkan loading saat semua datanya
                //saat sudah siap di terima
                return FutureBuilder(
                  future: news.getNewsCategory(tab.text.toString()),
                  builder: (context, snapshot) => snapshot.data != null
                  ? _listNewsCategory(snapshot.data as List<Article>) 
                  : const Center(child: CircularProgressIndicator(),) 
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> articles) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => NewsItem(article: articles[index]),
        ),
    );
  }
}
