import 'package:flutter/material.dart';
import 'package:mars_flutter/ui/alc_home_page.dart';

void main() {
  runApp(ALCTestApp());
}

class ALCTestApp extends StatefulWidget {
  @override
  _ALCTestAppState createState() => _ALCTestAppState();
}

class _ALCTestAppState extends State<ALCTestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: ALCHomePage(),

      )
    );
  }
}


