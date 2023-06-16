// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=0c427d48e2cf4f62830aa4872dd73bd4

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

import '../model/news_article.dart';

class FetchNews{
  // for showing random news everytime we create news provider list

  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",
    "cnn",
    "cbc-news",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];


  static Future<NewsArticle> fetchNews() async{
    final _random = Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    // print(sourceID);


    Response response = await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=Put your Api Key here you can get it from newsapi.org"));

    Map data = jsonDecode(response.body);

    List articles = data["articles"];
    final articleRandom = Random();
    var myArticle = articles[articleRandom.nextInt(articles.length)]; // for random articles

    return NewsArticle.fromAPItoApp(myArticle);
  }

}
