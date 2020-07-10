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
              return ListTile(
                title:Text("${_data[position]['title']}",
                style:TextStyle(fontSize: 14.9),
                ),
                leading:CircleAvatar(
                  backgroundColor: Colors.green,
                ),

              );
          }),
      ),
    ),
  ));
}


Future<List> getJson() async {
  String apiUrl='https://jsonplaceholder.typicode.com/posts';

  http.Response response=await http.get(apiUrl);

  return json.decode(response.body);
}