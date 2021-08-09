// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/models/list_news.dart';

class DetailNews extends StatelessWidget {

  final title;
  final description;
  final pubdate;
  final url;

  DetailNews(
    {this.title, 
    this.description,
    this.pubdate,
    this.url}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          url != null ? Image.network(url) : Container(
            height: 250,
            color: Colors.grey[200],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: <Widget>[
                Text(
                  '${title}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '${pubdate != null ? pubdate : '-'}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic
                  )
                ),
                SizedBox(height: 5,),
                Text('${description}'),
                Divider(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        tooltip: 'Back',
        splashColor: Colors.green[500],
        onPressed: ()=> Navigator.pop(context)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}