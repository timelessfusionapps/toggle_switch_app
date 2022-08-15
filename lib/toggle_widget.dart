import 'package:flutter/material.dart';
import 'package:toggle_switch_app/widgets/multiple_not_required.dart';
import 'package:toggle_switch_app/widgets/multiple_required.dart';
import 'package:toggle_switch_app/widgets/single_not_required.dart';
import 'package:toggle_switch_app/widgets/single_required.dart';

class ToggleWidgetExample extends StatelessWidget {
  const ToggleWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Widget'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: [
          buildWidget(
              title: 'Single Selection, Required',
              child: const SingleRequired()),
          const SizedBox(
            height: 20,
          ),
          buildWidget(
              title: 'Single Selection, Not Required',
              child: const SingleNotRequired()),
          const SizedBox(
            height: 20,
          ),
          buildWidget(
              title: 'Multiple Selection, Required',
              child: const MultipleRequired()),
          const SizedBox(
            height: 20,
          ),
          buildWidget(
              title: 'Multiple Selection, Not Required',
              child: const MultipleNotRequired()),
        ],
      ),
    );
  }

  Widget buildWidget({required String title, required Widget child}) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        child,
      ],
    );
  }
}
