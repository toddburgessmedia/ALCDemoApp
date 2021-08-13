
import 'package:flutter/material.dart';
import 'package:mars_flutter/model/planet.dart';
import 'package:mars_flutter/ui/mars_tab_page.dart';
import 'package:mars_flutter/ui/planets_tab_page.dart';

class ALCHomePage extends StatefulWidget {
  ALCHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ALCHomePageState createState() => _ALCHomePageState();
}

class _ALCHomePageState extends State<ALCHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Text('Mars'),
                    Text('Planets'),
                    Text('Web')
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  MarsTabPage(),
                  PlanetsTabPage(),
                  Text('WebView Placeholder')
                ],
              ),

          ),

        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}