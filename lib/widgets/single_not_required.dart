import 'package:flutter/material.dart';

class SingleNotRequired extends StatefulWidget {
  const SingleNotRequired({Key? key}) : super(key: key);

  @override
  State<SingleNotRequired> createState() => _SingleNotRequiredState();
}

class _SingleNotRequiredState extends State<SingleNotRequired> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.lightBlue.shade900,
      children: const [
        Icon(Icons.ac_unit),
        Icon(Icons.call),
        Icon(Icons.cake),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = !isSelected[index];
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
