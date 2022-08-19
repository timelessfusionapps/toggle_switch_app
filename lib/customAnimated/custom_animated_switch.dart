import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _CustomSwitchParams { paddingLeft, color, text, rotation }

class CustomAnimatedSwitch extends StatelessWidget {
  final bool toggle;

  const CustomAnimatedSwitch({Key? key, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String off = 'OFF';
    String on = 'ON';
    var customTween = MovieTween()
      ..scene(duration: const Duration(seconds: 1))
          .tween(_CustomSwitchParams.paddingLeft, 0.0.tweenTo(60.0))
      ..scene(duration: const Duration(seconds: 1))
          .tween(_CustomSwitchParams.color, Colors.red.tweenTo(Colors.green))
      ..scene(duration: const Duration(milliseconds: 500))
          .tween(_CustomSwitchParams.text, ConstantTween(off))
          .thenTween(_CustomSwitchParams.text, ConstantTween(on),
              duration: const Duration(milliseconds: 500))
      ..scene(duration: const Duration(seconds: 1))
          .tween(_CustomSwitchParams.rotation, (-2 * pi).tweenTo(0.0));

    return CustomAnimationBuilder<Movie>(
      control: toggle ? Control.play : Control.playReverse,
      startPosition: toggle ? 1.0 : 0.0,
      key: const Key('0'),
      duration: customTween.duration * 1.2,
      tween: customTween,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Container(
          decoration:
              _outerDecoration(color: value.get(_CustomSwitchParams.color)),
          width: 100.0,
          height: 40.0,
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: value.get(_CustomSwitchParams.paddingLeft),
                  ),
                  child: Transform.rotate(
                    angle: value.get(_CustomSwitchParams.rotation),
                    child: Container(
                      decoration: _innerDecoration(
                        color: value.get(_CustomSwitchParams.color),
                      ),
                      width: 30.0,
                      child: Center(
                        child: Text(
                          value.get(_CustomSwitchParams.text),
                          style: const TextStyle(
                              height: 1.5,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _outerDecoration({required Color color}) => BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        border: Border.all(width: 2, color: color),
      );
  BoxDecoration _innerDecoration({required Color color}) => BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(25.0),
      ),
      color: color);
}
