import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidgetExample extends StatefulWidget {
  const SwitchWidgetExample({Key? key}) : super(key: key);

  @override
  State<SwitchWidgetExample> createState() => _SwitchWidgetExampleState();
}

class _SwitchWidgetExampleState extends State<SwitchWidgetExample> {
  bool isLightOn = true;
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
          Image.asset(
            isLightOn ? 'assets/on.png' : 'assets/off.png',
            height: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          buildPlatformSpecific(),
          const SizedBox(
            height: 30,
          ),
          buildWidget(child: buildAdaptiveSwitch(), text: 'Adaptive Switch'),
          const SizedBox(
            height: 30,
          ),
          buildWidget(child: androidImageSwitch(), text: 'Image Switch'),
        ],
      ),
    );
  }

  Widget buildPlatformSpecific() => Column(
        children: [
          buildWidget(child: androidSwitch(), text: 'Android Switch'),
          const SizedBox(
            height: 20,
          ),
          buildWidget(child: iOSSwitch(), text: 'iOS Switch'),
        ],
      );
  Widget buildWidget({
    required Widget child,
    required String text,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );

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
          value: isLightOn,
          onChanged: (value) => setState(() => isLightOn = value),
        ),
      );

  Widget iOSSwitch() => Transform.scale(
        scale: 1.1,
        child: CupertinoSwitch(
          // overrides default green color of track
          activeColor: Colors.pink.shade200,
          // the color of round icon which moves from right to left
          thumbColor: Colors.green.shade900,
          // when the switch is off
          trackColor: Colors.black12,
          value: isLightOn,
          onChanged: (value) => setState(() => isLightOn = value),
        ),
      );

  Widget androidSwitch() => Transform.scale(
        scale: 1.5,
        child: Switch(
          activeColor: Colors.amber,
          activeTrackColor: Colors.cyan,
          inactiveThumbColor: Colors.blueGrey.shade600,
          inactiveTrackColor: Colors.grey.shade400,
          splashRadius: 50.0,
          value: isLightOn,
          onChanged: (value) => setState(() => isLightOn = value),
        ),
      );

  Widget androidImageSwitch() => Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 100,
          child: Switch(
            trackColor: MaterialStateProperty.all(Colors.black38),

            // thumb colors
            activeColor: Colors.green.withOpacity(0.4),
            inactiveThumbColor: Colors.red.withOpacity(0.4),

            activeThumbImage: const AssetImage('assets/thumbs_up.png'),
            inactiveThumbImage: const AssetImage('assets/thumbs_down.png'),
            value: isLightOn,
            onChanged: (value) => setState(() => isLightOn = value),
          ),
        ),
      );
}
