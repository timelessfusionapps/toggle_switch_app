import 'package:flutter/material.dart';

class MultipleNotRequired extends StatefulWidget {
  const MultipleNotRequired({Key? key}) : super(key: key);

  @override
  State<MultipleNotRequired> createState() => _MultipleNotRequiredState();
}

class _MultipleNotRequiredState extends State<MultipleNotRequired> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Cat', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Dog', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Bird', style: TextStyle(fontSize: 18)),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
    );
  }
}
