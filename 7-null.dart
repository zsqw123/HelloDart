import '4-class.dart';

main(List<String> args) {
  testNull(Point? p) => print(p?.x.bitLength);
  testNull(Point());
  Point? p;
  p ??= Point();
  p = p ?? Point();
  p!.x;
}

class LazyTest {
  late String awa;
  static late final LazyTest lazy = LazyTest();
}
