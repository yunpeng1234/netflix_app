import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grab_fe/main.dart';

final years = List<int>.generate(120, (int index) => 1900+ index, growable: true);

class LineChartSubmit extends ConsumerWidget {
  const LineChartSubmit({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int dropdownValueStart = ref.watch(lineChartStartProvider);
    final int dropdownValueEnd = ref.watch(lineChartEndProvider);
    return Row(
      children: [
        DropdownButton<int>(
          value: dropdownValueStart,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (int? value) {
            // This is called when the user selects an item.
             ref.read(lineChartStartProvider.notifier).state = value as int;
          },
          items: years.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ), 
        DropdownButton<int>(
          value: dropdownValueEnd,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (int? value) {
            // This is called when the user selects an item.
            ref.read(lineChartEndProvider.notifier).state = value as int;
          },
          items: years.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList(),
        ), 
      ],
    );
  }
}