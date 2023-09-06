import 'package:flutter/material.dart';
import 'package:flutternews/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

