import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/screen/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes App",
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity,appBarTheme: AppBarTheme(color: Colors.black87)),
      home: HomeScreen(),
    );
  }
}
