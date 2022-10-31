import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../api/type.dart';
import '../class/piechartprop.dart';

class PieChartWidget extends StatefulWidget {
  final int year;
  const PieChartWidget({required this.year, super.key});

  @override
  State<PieChartWidget> createState() => _PieChartState();
}

class _PieChartState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSplit(widget.year),
      builder: (BuildContext context, AsyncSnapshot<PieChartProp> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: Text('Please wait its loading...'));
        }else if (snapshot.hasError) {
          return Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              );
          }else{
          return PieChart(
              PieChartData(
                  sections: [
                    PieChartSectionData (
                      value: snapshot.data?.shows as double,
                      title: "Shows",
                      showTitle: true,
                      color: Colors.yellow
                    ),
                    PieChartSectionData (
                      value: snapshot.data?.movies as double,
                      title: "Movies",
                      showTitle: true,
                      color: Colors.blue
                    ),
                  ],
                ),
            );
        }
      });
  }
}