import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grab_fe/components/linechartsubmit.dart';
import 'package:grab_fe/linechartlist.dart';
import 'package:grab_fe/piechartlist.dart';

import 'components/piechartsubmit.dart';

final pieChartProvider = StateProvider((ref) => 1900);
final lineChartStartProvider = StateProvider((ref) => 1900);
final lineChartEndProvider = StateProvider((ref) => 1900);
final pieChartsProvider = StateProvider((ref) => [1900]);
final lineChartsProvider = StateProvider((ref) => [1900,1900]);

void main() {
  runApp(ProviderScope(
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Take Home assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Grab Demo'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  List<int> _pieChartList = [];
  List<List<int>> _lineChartList = [];

  void addPieChart(int year) {
    setState(() => {_pieChartList.add(year)});
  }

  void addLineChart(int sYear, int eYear) {
    setState(() => {_lineChartList.add([sYear,eYear])});
  }

  @override
  Widget build(BuildContext context) {
    final int piechartValue = ref.watch(pieChartProvider);
    final int lineChartStart = ref.watch(lineChartStartProvider);
    final int lineChartEnd = ref.watch(lineChartEndProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500.0,
                width: 400.0,
                child: PieChartListWidget(data : _pieChartList)
              ),
              Row(
                children: [
                  PieChartSubmit(),
                  IconButton(
                    onPressed: () => {
                      addPieChart(piechartValue),
                    }, 
                    icon: const Icon(Icons.pie_chart))
                ])
              ],
          )
        ),
        Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 500.0,
                width: 400.0,

                child: LineChartListWidget(data : _lineChartList),
              ),
              Row(
                children: [
                  LineChartSubmit(),  
                  IconButton(
                  onPressed: () => {
                    addLineChart(lineChartStart, lineChartEnd)
                  }, 
                  icon: const Icon(Icons.line_axis_outlined))],)
              ],
          ),
        )
        ]
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
