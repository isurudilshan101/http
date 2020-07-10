import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main() async {

  List _data=await getJson();

 // print(_data[0]['title']);

  //String _body="";

  // for (int i=0; i<_data.length; i++){
  //   print(_data[i]['title'] + " body : " + _data[i]['body']);
  // }

  //_body=_data[0]['body'];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Jason Parse'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: ListView.builder(
          itemCount:_data.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int position){
            if(position.isOdd) return Divider();
            final index=position ~/ 2;
              return ListTile(
                title:Text("${_data[index]['title']}",
                style:TextStyle(fontSize: 14.9),
                ),

                subtitle: Text("${_data[index]['body']}",
                style: TextStyle(fontSize: 13.4,
                color: Colors.grey,
                fontStyle: FontStyle.italic),
                ),

                leading:CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("${_data[index]['title'][0].toString().toUpperCase()}",
                  style:TextStyle(fontSize: 19.4,
                  color: Colors.orange[100]),
                ),

                ),

              
  onTap: () {_showOnTapMessage(context,"${_data[index]['title']}");}

                

              );

          }),
      ),
    ),
  ));
}



void _showOnTapMessage(BuildContext context, String message){
  var alert=AlertDialog(
    title: Text('App'),
    content: Text(message),
    actions: <Widget>[
      FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('OK')),
    ],
  );

  showDialog(context: context,child:alert);
}


Future<List> getJson() async {
  String apiUrl='https://jsonplaceholder.typicode.com/posts';

  http.Response response=await http.get(apiUrl);

  return json.decode(response.body);
}

