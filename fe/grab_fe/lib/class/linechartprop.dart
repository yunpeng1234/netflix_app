class LineChartProp {
  late List<LineChartPoint> points;

  LineChartProp(List<List<double>> points) {
    this.points = points.map((e) => LineChartPoint(e[0].round(), e[1])).toList();
  }
}

class LineChartPoint {
  int year;
  double averageRuntime;
  LineChartPoint(this.year, this.averageRuntime);
}