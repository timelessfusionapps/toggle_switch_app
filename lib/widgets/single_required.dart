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
    return Container(
      color: Colors.green.withOpacity(0.5),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Colors.lightBlue.shade900,
        renderBorder: false,
        //splashColor: Colors.red,
        highlightColor: Colors.orange,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('For Rent', style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('For Sale', style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text('Sold', style: TextStyle(fontSize: 18)),
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
      ),
    );
  }
}
