import 'package:chat/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //primarySwatch: Color.fromRGBO(5, 95, 85, 1.0),,
          iconTheme: IconThemeData(color: Colors.blue)),
      home: ChatPage(),
    );
  }
}
