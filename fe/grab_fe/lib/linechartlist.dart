import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grab_fe/chart/linegraph.dart';

class LineChartListWidget extends StatefulWidget {
  final List<List<int>> data;
  const LineChartListWidget({super.key,  required this.data});
  @override
  State<LineChartListWidget> createState() => _LineChartListWidgetState();
}

class _LineChartListWidgetState extends State<LineChartListWidget>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) { 
        return  SizedBox(height: 300, child: LineChartWidget(startYear: widget.data[index][0], 
        endYear: widget.data[index][1]));
        },
      shrinkWrap: true,
    );
  }
}