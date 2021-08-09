// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/models/list_batik.dart';
import 'package:intl/intl.dart';

class DetailBatik extends StatelessWidget {

  final url;
  final title;
  final daerah;
  final maknaBatik;
  final hargaRendah;
  final hargaTinggi;
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');

  DetailBatik(
    {this.url, 
    this.title,
    this.daerah,
    this.maknaBatik,
    this.hargaRendah,
    this.hargaTinggi}
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
                  'Batik ${title}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Asal : ${daerah != null ? daerah : '-'}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic
                  )
                ),
                SizedBox(height: 5,),
                Text('${maknaBatik}'),
                Divider(),
                Text('Harga : ${formatCurrency.format(hargaRendah)} - ${formatCurrency.format(hargaTinggi)}'),
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