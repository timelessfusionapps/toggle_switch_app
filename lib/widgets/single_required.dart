import 'package:flutter/material.dart';

class SingleRequired extends StatefulWidget {
  const SingleRequired({Key? key}) : super(key: key);

  @override
  State<SingleRequired> createState() => _SingleRequiredState();
}

class _SingleRequiredState extends State<SingleRequired> {
  // one must always be true, means selected.
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      // list of booleans
      isSelected: isSelected,
      // text color of selected toggle
      selectedColor: Colors.white,
      // text color of not selected toggle
      color: Colors.blue,
      // fill color of selected toggle
      fillColor: Colors.lightBlue.shade900,
      // when pressed splash color is seen
      splashColor: Colors.red,
      // long press to identify highlight color
      highlightColor: Colors.orange,
      // if consistency is needed for all text style
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      // border properties for each toggle
      renderBorder: true,
      borderColor: Colors.black,
      borderWidth: 1.5,
      borderRadius: BorderRadius.circular(10),
      selectedBorderColor: Colors.pink,

      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('MALE', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('FEMALE', style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('OTHER', style: TextStyle(fontSize: 18)),
        ),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
