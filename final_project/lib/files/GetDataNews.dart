import 'package:flutter/material.dart';
// import 'dart:developer';
import 'package:intl/intl.dart';
import '/models/list_news.dart';
// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import '/files/DetailNews.dart';
// dio
import 'package:dio/dio.dart';


class GetDataNews extends StatefulWidget {
  // const GetDataNews({ Key? key }) : super(key: key);

  @override
  _GetDataNewsState createState() => _GetDataNewsState();
}

class _GetDataNewsState extends State<GetDataNews> {

  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  Future<ListNews> listNews;
  Future<ListNews> getListNews() async{
    // fetch data from api  
    var dio = Dio();
    final response = await dio.get('https://api-berita-indonesia.vercel.app/cnbc/market/');
    // https://api-berita-indonesia.vercel.app/cnbc/market/
    // https://api-berita-indonesia.vercel.app/cnbc/news/
    // print(response.data);
    if (response.statusCode == 200) {
      return ListNews.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState(){
    super.initState();
    listNews = getListNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder(
        future: listNews,
        builder: (context, snapshot){
          if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: 
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )
                  ,),
                );
              }else {
          return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  itemCount: snapshot.data.data.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Container(
                          color:Colors.grey[200],
                          height: 80,
                          width: 90,
                          child: 
                              Image.network(snapshot.data.data.posts[index].thumbnail)
                          ),
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(
                        //       '${snapshot.data.data.posts[index].thumbnail}'),
                        // ),
                        title: Text(
                          "${ snapshot.data.data.posts[index].title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c) => DetailNews(
                            url: snapshot.data.data.posts[index].thumbnail,
                            title: snapshot.data.data.posts[index].title,
                            description: snapshot.data.data.posts[index].description,
                            pubdate: snapshot.data.data.posts[index].pubDate,
                          ))
                          
                          );
                        },
                      );
                });
          }
        },
        ),
    );
  }
}