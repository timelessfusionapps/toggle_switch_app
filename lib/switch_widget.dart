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
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        shrinkWrap: true,
        children: [
          const Spacer(),
          Image.asset(
            isLightOn ? 'assets/on.png' : 'assets/off.png',
            height: 300,
          ),
          const Spacer(),
          buildPlatformSpecific(),
          const Spacer(),
          buildWidget(child: buildAdaptiveSwitch(), text: 'Adaptive Switch'),
          const Spacer(),
          buildWidget(
              child: androidImageSwitch(), text: 'Android Image Switch'),
        ],
      ),
    );
  }

  Widget buildPlatformSpecific() => Row(
        children: [
          Expanded(
            child: buildWidget(child: androidSwitch(), text: 'Android Switch'),
          ),
          Expanded(
            child: buildWidget(child: iOSSwitch(), text: 'iOS Switch'),
          ),
        ],
      );
  Widget buildWidget({
    required Widget child,
    required String text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
        scale: 2,
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
          value: isLightOn,
          onChanged: (value) => setState(() => isLightOn = value),
        ),
      );

  Widget androidSwitch() => Transform.scale(
        scale: 2,
        child: Switch(
          value: isLightOn,
          onChanged: (value) => setState(() => isLightOn = value),
        ),
      );

  Widget androidImageSwitch() => Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 75,
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
