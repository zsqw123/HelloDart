main(List<String> args) {
  p1(num a, num b, num c) {}
  p1(1, 2, 3);

  p2([num a = 0, num b = 1]) {}
  p2();
  p2(1);
  p2(1, 2);

  p3({required num a, num b = 1, num c = 0}) {}
  p3(a: 1);
  p3(a: 1, b: 2);
  p3(a: 1, b: 2, c: 3);

  1.pr();
  // p4(num a, num b, [num c = 0]) {}
  // p5(num a, num b, {num d = 1, num e = 2}) {}
}

extension p on Object {
  pr() => print(this);
}
