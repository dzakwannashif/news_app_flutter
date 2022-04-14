import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/model/article.dart';

String apiKey = '30d76602be804fbc81e71e410a707e98';
String baseUrl = 'https://newsapi.org/v2';

class News {
  
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=us&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else{
      throw Exception("cann't load data");
    }
  }

  Future<List<Article>?> getNewsCategory(String category) async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("error can't get data");
    }
  }
}
