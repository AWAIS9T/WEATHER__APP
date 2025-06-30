import 'package:flutter/material.dart';
import 'package:untitled/Activity/home.dart' show Home;
import 'package:untitled/Activity/loading.dart';
import 'package:untitled/Activity/location.dart';



void main() {
  runApp( MaterialApp(
    routes: {
      "/":(context)=> Loading(),
      "/home":(context)=> Home(),
      "/loading":(context)=>Loading(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

