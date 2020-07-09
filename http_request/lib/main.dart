import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main() async {

  List _data=await getJson();

  print(_data[0]);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Jason Parse'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text('Parsing...'),
      ),
    ),
  ));
}


Future<List> getJson() async {
  String apiUrl='https://jsonplaceholder.typicode.com/posts';

  http.Response response=await http.get(apiUrl);

  return jsonDecode(response.body);
}