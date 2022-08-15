import 'package:flutter/material.dart';

class MultipleRequired extends StatefulWidget {
  const MultipleRequired({Key? key}) : super(key: key);

  @override
  State<MultipleRequired> createState() => _MultipleRequiredState();
}

class _MultipleRequiredState extends State<MultipleRequired> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      borderWidth: 3,
      borderColor: Colors.lightBlue.shade900,
      selectedBorderColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(50),
      children: const [
        Icon(Icons.ac_unit),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('Any', style: TextStyle(fontSize: 18)),
        ),
        Icon(Icons.cake),
      ],
      onPressed: (int newIndex) {
        final isOneSelected =
            isSelected.where((element) => element).length == 1;

        if (isOneSelected && isSelected[newIndex]) return;

        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = !isSelected[index];
            }
          }
        });
      },
    );
  }
}
