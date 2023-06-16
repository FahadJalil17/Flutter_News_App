import 'package:flutter/material.dart';
import 'package:news_snack/view/widgets/news_container.dart';

import '../controller/fetch_news.dart';
import '../model/news_article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late NewsArticle newsArticle;
  bool isLoading = true;

  getNews() async{
    newsArticle = await FetchNews.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
          onPageChanged: (value){
          setState(() {
            isLoading = true;
          });
          getNews();
          },
          itemBuilder: (context, index){

        return isLoading ? Center(child: CircularProgressIndicator(),)
        :
          NewsContainer(
          // imgUrl: 'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
          imgUrl: newsArticle.imgUrl,
          newsHead: newsArticle.newsHead,
          newsDesc: newsArticle.newsDesc,
          newsCnt: newsArticle.newsCnt,
          newsUrl: newsArticle.newsUrl,
        );
      }),
    );
  }
}

