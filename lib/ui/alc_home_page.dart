
import 'package:flutter/material.dart';
import 'package:mars_flutter/ui/alc_tab_page.dart';
import 'package:mars_flutter/ui/mars_tab_page.dart';
import 'package:mars_flutter/ui/planets_tab_page.dart';

class ALCHomePage extends StatefulWidget {

  ALCHomePage({Key? key}) : super(key: key);

  @override
  _ALCHomePageState createState() => _ALCHomePageState();
}

class _ALCHomePageState extends State<ALCHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ALC Test App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTabController(
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
                    ALCTabPage()
                  ],
                ),
            ),
          ),
        )
    );
  }
}