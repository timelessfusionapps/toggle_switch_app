import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidgetExample extends StatefulWidget {
  const SwitchWidgetExample({Key? key}) : super(key: key);

  @override
  State<SwitchWidgetExample> createState() => _SwitchWidgetExampleState();
}

class _SwitchWidgetExampleState extends State<SwitchWidgetExample> {
  bool forAndroid = true;
  bool forIos = true;
  bool forAdaptive = true;
  bool forImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 10,
          ),
          buildPlatformSpecific(),
          const SizedBox(
            height: 30,
          ),
          buildWidget(
              image: Image.asset(
                forAdaptive ? 'assets/on.png' : 'assets/off.png',
                height: 50,
              ),
              child: buildAdaptiveSwitch(),
              text: 'Adaptive Switch'),
          const SizedBox(
            height: 30,
          ),
          buildWidget(
              image: Image.asset(
                forImage ? 'assets/on.png' : 'assets/off.png',
                height: 50,
              ),
              child: androidImageSwitch(),
              text: 'Image Switch'),
        ],
      ),
    );
  }

  Widget buildPlatformSpecific() => Column(
        children: [
          buildWidget(
              image: Image.asset(
                forAndroid ? 'assets/on.png' : 'assets/off.png',
                height: 50,
              ),
              child: androidSwitch(),
              text: 'Android Switch'),
          const SizedBox(
            height: 20,
          ),
          buildWidget(
              image: Image.asset(
                forIos ? 'assets/on.png' : 'assets/off.png',
                height: 50,
              ),
              child: iOSSwitch(),
              text: 'iOS Switch'),
        ],
      );
  Widget buildWidget({
    required Widget child,
    required Widget image,
    required String text,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image,
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );

  // transform widget is used to increase the size of the switch widget.
  Widget buildAdaptiveSwitch() => Transform.scale(
        scale: 1.2,
        child: Switch.adaptive(
          thumbColor: MaterialStateProperty.all(Colors.red),
          trackColor: MaterialStateProperty.all(Colors.orange),
          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue.withOpacity(0.4),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.black87,
          splashRadius: 50,
          value: forAdaptive,
          onChanged: (value) => setState(() => forAdaptive = value),
        ),
      );

// transform widget is used to increase the size of the switch widget.
  Widget iOSSwitch() => Transform.scale(
        scale: 1.1,
        child: CupertinoSwitch(
          // overrides default green color of track
          activeColor: Colors.pink.shade200,
          // the color of round icon which moves from right to left
          thumbColor: Colors.green.shade900,
          // when the switch is off
          trackColor: Colors.black12,
          // boolean variable value
          value: forIos,
          // changes the state of the switch
          onChanged: (value) => setState(() => forIos = value),
        ),
      );

// transform widget is used to increase the size of the switch widget.
  Widget androidSwitch() => Transform.scale(
        scale: 1.5,
        child: Switch(
          // thumb color (round icon)
          activeColor: Colors.amber,
          activeTrackColor: Colors.cyan,
          inactiveThumbColor: Colors.blueGrey.shade600,
          inactiveTrackColor: Colors.grey.shade400,
          splashRadius: 50.0,
          // boolean variable value
          value: forAndroid,
          // changes the state of the switch
          onChanged: (value) => setState(() => forAndroid = value),
        ),
      );

  // transform widget is used to increase the size of the switch widget.
  Widget androidImageSwitch() => Transform.scale(
        scale: 2,
        child: Switch(
          trackColor: MaterialStateProperty.all(Colors.black38),
          activeColor: Colors.green.withOpacity(0.4),
          inactiveThumbColor: Colors.red.withOpacity(0.4),
          // when the switch is on, this image will be displayed
          activeThumbImage: const AssetImage('assets/happy_emoji.png'),
          // when the switch is off, this image will be displayed
          inactiveThumbImage: const AssetImage('assets/sad_emoji.png'),
          value: forImage,
          onChanged: (value) => setState(() => forImage = value),
        ),
      );
}
