import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grab_fe/chart/linegraph.dart';
import 'package:grab_fe/chart/piechart.dart';

class PieChartListWidget extends StatefulWidget {
  final List<int> data;
  const PieChartListWidget({super.key, required this.data});
  @override
  State<PieChartListWidget> createState() => _PieChartListWidgetState();
}

class _PieChartListWidgetState extends State<PieChartListWidget>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) { 
        return SizedBox(height: 300, child: PieChartWidget(year : widget.data[index]));
      },
      shrinkWrap: true,
    );
  }
}