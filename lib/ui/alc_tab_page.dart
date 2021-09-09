
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ALCTabPage extends StatefulWidget {
  const ALCTabPage({Key? key}) : super(key: key);

  @override
  _ALCTabPageState createState() => _ALCTabPageState();
}

class _ALCTabPageState extends State<ALCTabPage> {
  final _key = UniqueKey();
  int _position = 1;
  double _progress = 0;





  _showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("WebView Notification"),
      content: Text("The webpage has finished loading"),
      actions: [
        TextButton(
          child: Text("Awesome"),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _position,
      children: <Widget>[
        WebView(
          key: _key,
          initialUrl: 'https://www.alc.ca/content/alc-mobile/en.html',
          onProgress: (int loaded) {
              setState(() {
                _progress = loaded.toDouble();
              });
          },
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String url) {
            setState(() {
              _position = 0;
            });
            _showAlertDialog(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: Text('Webpage Loading Progress')),
              LinearProgressIndicator(
                  value: _progress,
                  minHeight: 25,
                  backgroundColor: Colors.cyanAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red)
              )
            ],
          ),
        )
      ],
    );
  }
}
