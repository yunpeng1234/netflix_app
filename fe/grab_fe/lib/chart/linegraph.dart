import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../api/runtime.dart';
import '../class/linechartprop.dart';

class LineChartWidget extends StatefulWidget {
  final int startYear;
  final int endYear;

  const LineChartWidget({required this.startYear, required this.endYear, super.key});

  @override
  State<LineChartWidget> createState() => _LineChartState();
}

class _LineChartState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRuntime(widget.startYear, widget.endYear),
      builder: (BuildContext context, AsyncSnapshot<LineChartProp> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: Text('Please wait its loading...'));
        }else{
          return LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: snapshot.data?.points.map((props) => FlSpot(props.year as double, props.averageRuntime as double)).toList(),
                  isCurved: false,
                ),
              ],
            ),
          );
        }
    });
  }
}