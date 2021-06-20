main(List<String> args) {
  int a = 1;
  bool b = false;
  double c = 1;
  num d = 2;
  num e = 1.1;
  var f = 1;
  final g = 1.0;
  print(a);
  print(b);
  print(c);
  print(d);
  print(e);
  print(f);
  print(g);

  print("-----1-----");

  List<int> aa = [1, 2, 3];
  List bb = [1, 2, false];
  var cc = [1, 2, false];
  const dd = [1, 2, false];
  final ee = [1, 2, false];
  var map = {1: 1, 2: "awa", "emm": "2333"};

  print(aa);
  print(bb);
  print(cc);
  print(dd);
  print(ee);
  print(map);

  var i = 10;
  print("i = $i");
  var s = 'awa';
  print("$s.length is ${s.length}");
  print("\$");
  var aaa = '''
s$s
\$''';
  print(aaa);
  var bbb = r'''
s$s
\$''';
  print(bbb);
}
