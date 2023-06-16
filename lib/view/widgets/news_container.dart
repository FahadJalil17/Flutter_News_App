import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view_screen.dart';

class NewsContainer extends StatelessWidget {
  
  String imgUrl, newsHead, newsDesc, newsUrl, newsCnt; // newsContent
  
  NewsContainer({Key? key, 
    required this.imgUrl, 
    required this.newsHead, 
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "assets/placeholder.jfif", image: imgUrl),
          // Image.network(imgUrl, height: 300, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(newsHead.length > 70 ? "${newsHead.substring(0, 70)}..." : newsHead,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(newsDesc, style: TextStyle(fontSize: 12, color: Colors.black38),),
                SizedBox(height: 10,),
                Text(
                  newsCnt != "--" ?
                  newsCnt.length > 250 ? "${newsCnt.substring(0, 250)}..."
                      : "${newsCnt.substring(0, newsCnt.length - 15)}..."
                  : newsCnt,
                  style: TextStyle(fontSize: 16),)
              ],
            ),
          ),

          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailViewScreen(newsUrl: newsUrl)));
              }, child: Text("Read More")),
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}

