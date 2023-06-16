
class NewsArticle{
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  NewsArticle({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl
});

  static NewsArticle fromAPItoApp(Map<String, dynamic> article){
    return NewsArticle(
        imgUrl: article["urlToImage"] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000", // breaking news pic
        newsHead: article["title"] ?? "--", // if null then show --
        newsDesc: article["description"] ?? "--",
        newsCnt: article["content"] ?? "--",
        newsUrl: article["url"] ?? "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en" // google news
    );
  }

}
