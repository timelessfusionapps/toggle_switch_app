import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveThemeSwitch extends StatelessWidget {
  const HiveThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('hiveThemeBox').listenable(),
      builder: (context, box, widget) {
        var darkMode =
            Hive.box('hiveThemeBox').get('darkMode', defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: Switch(
                value: darkMode,
                onChanged: (val) {
                  Hive.box('hiveThemeBox').put('darkMode', !darkMode);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
