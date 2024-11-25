import 'package:flutter/material.dart';
import 'home_page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo de Palavras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage1(),
    );
  }
}
