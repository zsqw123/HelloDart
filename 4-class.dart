main(List<String> args) {
  // Point p0 = Point(1, 2);
  // Point p1 = Point.alongX(1);
  // Point p2 = Point.fromList([1, 2]);
  PointWithDistance pd = PointWithDistance(1, 2);
  print(pd.distance);
}

class Point {
  int x = 0, y = 0;
  Point([this.x = 1, this.y = 1]);
  Point.alongX(int x) : this(x, 0); // 重定向
  Point.fromList(List<int> list) {
    // 命名构造
    x = list[0];
    y = list[1];
  }
}

class PointWithDistance {
  int x, y;
  final int distance;
  PointWithDistance(this.x, this.y) : distance = x + y;
}

class ThreeDimensionPoint extends Point {
  int z;
  ThreeDimensionPoint(this.z) : super(0, 0);
  ThreeDimensionPoint.x1(this.z) : super.alongX(1);
}

class ConstPoint {
  final int x, y;
  const ConstPoint(this.x, this.y);
}

class FactoryPoint {
  static FactoryPoint? ins;
  factory FactoryPoint() {
    if (ins == null) ins = FactoryPoint();
    return ins!;
  }
}