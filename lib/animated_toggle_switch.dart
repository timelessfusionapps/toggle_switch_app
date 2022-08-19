import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class AnimatedToggleSwitchButton extends StatefulWidget {
  const AnimatedToggleSwitchButton({Key? key}) : super(key: key);

  @override
  State<AnimatedToggleSwitchButton> createState() =>
      _AnimatedToggleSwitchButtonState();
}

class _AnimatedToggleSwitchButtonState
    extends State<AnimatedToggleSwitchButton> {
  int value = 0;
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Animated Toggle Switch Dual'),
      ),
      body: Center(
        child: AnimatedToggleSwitch<bool>.dual(
          current: positive,
          first: false,
          second: true,
          dif: 50.0,
          borderColor: Colors.transparent,
          borderWidth: 5.0,
          height: 55,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
          ],
          onChanged: (b) => setState(() => positive = b),
          colorBuilder: (b) => b ? Colors.red : Colors.green,
          iconBuilder: (value) => value
              ? const Icon(Icons.coronavirus_rounded)
              : const Icon(Icons.tag_faces_rounded),
          textBuilder: (value) => value
              ? const Center(child: Text('Oh no...'))
              : const Center(child: Text('Nice :)')),
        ),
      ),
    );
  }
}
