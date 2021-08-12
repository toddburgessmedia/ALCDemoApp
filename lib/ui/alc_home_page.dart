
import 'package:flutter/material.dart';

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
                    Tab(icon: Icon(Icons.adjust_outlined)),
                    Tab(icon: Icon(Icons.list),),
                    Tab(icon: Icon(Icons.web),)
                  ],
                ),
              )

          ),

        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}