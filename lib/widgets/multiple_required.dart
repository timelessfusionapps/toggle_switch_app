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
      textStyle: const TextStyle(fontSize: 20),
      selectedBorderColor: Colors.lightBlue,
      borderRadius: BorderRadius.circular(10),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Icon(
                Icons.delivery_dining,
                size: 32,
              ),
              Text('Delivery'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Icon(
                Icons.dinner_dining,
                size: 32,
              ),
              Text('Dining'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Icon(
                Icons.fastfood,
                size: 32,
              ),
              Text('Carry Out'),
            ],
          ),
        ),
      ],
      onPressed: (int newIndex) {
        /*We looping through the list of booleans
        * We make sure that value is true
        * and therefore at least one is always selected
        * */
        final isOneSelected =
            isSelected.where((element) => element).length == 1;
        /*If only one button is selected we cannot toggle it to false
        * but we can also select another button
        * */
        if (isOneSelected && isSelected[newIndex]) return;

        setState(() {
          // looping through the list of booleans
          for (int index = 0; index < isSelected.length; index++) {
            // checking for the index value
            if (index == newIndex) {
              // toggle between old index and new index value
              isSelected[index] = !isSelected[index];
            }
          }
        });
      },
    );
  }
}
