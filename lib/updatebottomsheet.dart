import 'package:flutter/material.dart';

class UpdateBottomSheet extends StatefulWidget {
  final RangeValues currentRangeValues;
  final Function(RangeValues) onUpdate;

  const UpdateBottomSheet({
    required this.currentRangeValues,
    required this.onUpdate,
    Key? key,
  }) : super(key: key);

  @override
  _UpdateBottomSheetState createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  late RangeValues _rangeValues;

  @override
  void initState() {
    super.initState();
    _rangeValues = widget.currentRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Adjust the Range",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          RangeSlider(
            values: _rangeValues,
            min: 0,
            max: 1,
            divisions: 100,
            onChanged: (RangeValues values) {
              setState(() {
                _rangeValues = values;
              });
            },
            labels: RangeLabels(
              _rangeValues.start.toStringAsFixed(2),
              _rangeValues.end.toStringAsFixed(2),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.onUpdate(_rangeValues);
              Navigator.of(context).pop(UpdateBottomSheetResult(
                _rangeValues.start,
              ));
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }
}

UpdateBottomSheetResult(double start) {}
