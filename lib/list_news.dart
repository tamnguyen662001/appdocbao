import 'package:appdocbao/VNexpressRSSItem.dart';
import 'package:appdocbao/news_detail.dart';
import 'package:appdocbao/ssr_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  List<RSSItem> list;
  ListNews({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        RSSItem news = list[index] ;
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NewsDetail(news: news),)
            );
          },
          child: ListTile(
            leading: Image.network(news.getImageUrl(news.description!)),
            title : Text(news.title!),
          ),
        );
      },
    );
  }

  VNExpressRSSItem getExpressRSSItem( RSSItem item){
    VNExpressRSSItem? expressRSSItemitem;
    expressRSSItemitem!.title = item.title;
    expressRSSItemitem.pubDate = item.pubDate;
    expressRSSItemitem.description = item.description;
    expressRSSItemitem.link = item.link;
    expressRSSItemitem.imageUrl = item.imageUrl;
    return expressRSSItemitem;
  }
}