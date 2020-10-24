import 'package:beber_agua/pages/history/history_page.dart';
import 'package:beber_agua/pages/home/home_page.dart';
import 'package:beber_agua/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasePage extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Beber Água"),
            centerTitle: true,
            elevation: 0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  //icon: Icon(Icons.android),
                  icon: FaIcon(FontAwesomeIcons.tint),
                  //text: 'Beber',
                ),
                Tab(
                  //icon: Icon(Icons.history),
                  icon: FaIcon(FontAwesomeIcons.history),
                  //text: 'Histórico',
                ),
                Tab(
                  //icon: Icon(Icons.settings),
                  icon: FaIcon(FontAwesomeIcons.cog),
                  //text: 'Configurações',
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomePage(),
              HistoryPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
