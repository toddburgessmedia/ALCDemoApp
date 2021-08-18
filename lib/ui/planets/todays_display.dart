
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodaysDisplay extends StatefulWidget {
  const TodaysDisplay({Key? key}) : super(key: key);

  @override
  _TodaysDisplayState createState() => _TodaysDisplayState();
}

class _TodaysDisplayState extends State<TodaysDisplay> {

  double opacity = 1.0;
  String _todayDate = "";


  @override
  void initState() {
    super.initState();
    _todayDate = _formatDate();
    _changeOpacity();
  }

  _changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      if (this.mounted) {
        setState(() {
          opacity = opacity == 0.0 ? 1.0 : 0.0;
          _changeOpacity();
        });
      }
    });
  }

  String _formatDate() {
    final df = DateFormat('MMMM d, y', 'en_US');
    return df.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 1000),
      child: Center(child: Text(_todayDate)),
    );
  }
}
