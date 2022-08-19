import 'package:flutter/material.dart';
import 'package:toggle_switch_app/customAnimated/custom_animated_switch.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({Key? key}) : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool _switched = false;

  void toggleSwitch() {
    setState(() {
      _switched = !_switched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animated Switch'),
      ),
      body: GestureDetector(
        onTap: toggleSwitch,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Tap to Check Custom Animated Switch'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomAnimatedSwitch(toggle: _switched),
            ],
          ),
        ),
      ),
    );
  }
}
