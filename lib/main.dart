/*
88888b.  .d88b. 88888b.  .d8888b .d88b. 888d88888888b.  
888 "88bd88""88b888 "88bd88P"   d88""88b888P"  888 "88b 
888  888888  888888  888888     888  888888    888  888 
888 d88PY88..88P888 d88PY88b.   Y88..88P888    888  888 
88888P"  "Y88P" 88888P"  "Y8888P "Y88P" 888    888  888 
888             888                                     
888             888                                     
888             888                                     

code by Max

*/

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

String title = "POPcorn";

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('WatchList');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        fontFamily: 'REM',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
