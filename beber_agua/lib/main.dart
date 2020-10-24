import 'package:beber_agua/pages/base/base_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beber Água',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/base',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/base':
            return MaterialPageRoute(builder: (_) => BasePage());

            break;
          default:
            return MaterialPageRoute(builder: (_) => BasePage());
        }
      },
    );
  }
}
