import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toggle_switch_app/switch_widget.dart';

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
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SwitchWidgetExample()),
          );
        },
        child: const Text('Switch Widget'),
      )),
    );
  }
}
