class LineChartViewModel {
  String lineTitle;
  List<LineChartPointViewModel> points;

  LineChartViewModel(this.lineTitle, this.points);
}

class LineChartPointViewModel {
  double x;
  double y;

  LineChartPointViewModel(this.x, this.y);
}
