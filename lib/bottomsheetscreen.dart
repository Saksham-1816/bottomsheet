import 'package:bottomsheet/updatebottomsheet.dart';
import 'package:flutter/material.dart';

class Bottomsheetscreen extends StatefulWidget {
  const Bottomsheetscreen({super.key});

  @override
  State<Bottomsheetscreen> createState() => _BottomsheetscreenState();
}

class _BottomsheetscreenState extends State<Bottomsheetscreen> {
  RangeValues values = RangeValues(0.1, 0.9);
  _updateValues(RangeValues newValues) {
    setState(() {
      values = RangeValues(newValues.start, newValues.end);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text("Bottom Sheet screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Range values: ${values.start.round()} - ${values.end.round()}"),
          SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return UpdateBottomSheet(
                    currentRangeValues: values,
                    onUpdate: _updateValues,
                  );
                },
              );
            },
            child: Text("Show Modal Bottom Sheet"),
          ),
        ],
      ),
    );
  }
}
