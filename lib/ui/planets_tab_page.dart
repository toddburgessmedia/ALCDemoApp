
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PlanetsTabPage extends StatefulWidget {


  @override
  _PlanetsTabPageState createState() => _PlanetsTabPageState();
}

class _PlanetsTabPageState extends State<PlanetsTabPage> {

  double opacity = 1.0;
  String _todayDate = "";

  @override
  void initState() {
    super.initState();
    changeOpacity();
    _todayDate = _formatDate();
    print('date $_todayDate');
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }

  String _formatDate() {
    final df = DateFormat('MMMM d, y','en_US');
    return df.format(DateTime.now());

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 1000),
              child: Text(_todayDate),
          )
        ],
      ),
    );
  }
}