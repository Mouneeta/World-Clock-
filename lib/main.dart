// @dart=2.9
import 'package:flutter/material.dart';
import 'package:world_time/choose_location.dart';
import 'home.dart';
import 'choose_location.dart';
import 'loading.dart';



void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));

}


