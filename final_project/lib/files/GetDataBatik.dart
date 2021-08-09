import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:intl/intl.dart';
import '/models/list_batik.dart';
import '/files/DetailBatik.dart';
// dio
import 'package:dio/dio.dart';


class GetDataBatik extends StatefulWidget {
  // const GetDataBatik({ Key? key }) : super(key: key);

  @override
  _GetDataBatikState createState() => _GetDataBatikState();
}

class _GetDataBatikState extends State<GetDataBatik> {

  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  Future<ListBatik> listBatik;
  Future<ListBatik> getListBatik() async{
    // fetch data from api  
    var dio = Dio();
    final response = await dio.get('http://batikita.herokuapp.com/index.php/batik/all');
    // print(response.data);
    if (response.statusCode == 200) {
      return ListBatik.fromJson(response.data);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState(){
    super.initState();
    listBatik = getListBatik();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Batik Indonesia'),
      ),
      body: FutureBuilder(
        future: listBatik,
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: 
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )
                    // Text("Loading ..")
                  ,),
                );
          }else {
          return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  itemCount: snapshot.data.hasil.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${snapshot.data.hasil[index].linkBatik}'),
                        ),
                        title: Text(
                          "Batik ${snapshot.data.hasil[index].namaBatik}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        subtitle:
                            Text("${snapshot.data.hasil[index].daerahBatik}"),
                        
                        trailing: Text("${formatCurrency.format(snapshot.data.hasil[index].hargaRendah)} - ${formatCurrency.format(snapshot.data.hasil[index].hargaTinggi)}"),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c) => DetailBatik(
                            url: snapshot.data.hasil[index].linkBatik,
                            title: snapshot.data.hasil[index].namaBatik,
                            daerah: snapshot.data.hasil[index].daerahBatik,
                            maknaBatik: snapshot.data.hasil[index].maknaBatik,
                            hargaRendah: snapshot.data.hasil[index].hargaRendah,
                            hargaTinggi: snapshot.data.hasil[index].hargaTinggi,
                          ))
                          
                          );
                        },
                      ),
                    );
                });
        }},
        ),
    );
  }
}