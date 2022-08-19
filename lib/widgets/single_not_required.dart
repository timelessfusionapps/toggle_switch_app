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
      fillColor: Colors.brown.shade900,
      borderColor: Colors.brown,
      children: const [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.phone,
            size: 48,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.phone_callback,
            size: 48,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.phone_disabled,
            size: 48,
          ),
        ),
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
