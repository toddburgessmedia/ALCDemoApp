
import 'package:flutter/material.dart';

class DiameterPickerDialog extends StatefulWidget {
  // final largest;

  const DiameterPickerDialog();

  @override
  _DiameterPickerDialogState createState() => _DiameterPickerDialogState();
}

class _DiameterPickerDialogState extends State<DiameterPickerDialog> {
  double _slidervalue = 0.0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context,setstate) {
      return
        AlertDialog(
          title: Text("Filter Planets by Diameter"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Slider(
                  value: _slidervalue,
                  min: 0,
                  max: 50000,
                  label: _slidervalue.round().toString(),
                  divisions: 10,
                  onChanged: (double value) {
                    setState(() {
                      _slidervalue = value;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Go"),
              onPressed: () {
                Navigator.pop(context, _slidervalue);
              },
            )
          ],
        );
    });
  }
}