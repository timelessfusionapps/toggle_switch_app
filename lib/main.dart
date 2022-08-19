import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toggle_switch_app/animated_toggle_switch.dart';
import 'package:toggle_switch_app/customAnimated/custom_switch_button.dart';
import 'package:toggle_switch_app/switch_widget.dart';
import 'package:toggle_switch_app/toggle_widget.dart';

const themeBox = 'hiveThemeBox';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(themeBox).listenable(),
      builder: (context, box, widget) {
        var darkMode = Hive.box(themeBox).get('darkMode', defaultValue: false);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            title: 'Flutter Demo',
            //theme: ThemeData(platform: TargetPlatform.android),
            darkTheme: ThemeData.dark(),
            home: HomePage(
              value: darkMode,
            ));
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final bool value;
  const HomePage({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(value ? 'Hive Dark Mode' : 'Hive Light Mode'),
        actions: [
          Switch(
            value: value,
            onChanged: (val) {
              Hive.box(themeBox).put('darkMode', !value);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.blueGrey.shade600),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SwitchWidgetExample()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Switch Widget',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.blueGrey.shade600),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ToggleWidgetExample()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Toggle Widget',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.blueGrey.shade600),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomSwitchButton()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Custom Animated Switch',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: Colors.blueGrey.shade600),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedToggleSwitchButton()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Animated Toggle Switch',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
