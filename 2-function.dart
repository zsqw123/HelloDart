main(List<String> args) {
  awa(int qwq(int q)) {
    print("awa");
    return;
  }

  var p1 = (q) => 1;
  var p2 = (q) {
    return 1;
  };
  awa(p1);
  awa(p2);

  int pram1(int a) => a;
  int pram2(int a, int b) => a + b;
  int func1(int f1(int a)) => f1(1);
  int func2(int f2(int a, int b)) => f2(1, 2);
  print(func1(pram1));
  print(func2(pram2));
  print('-----1-----');

  var list = [1, 2, 3, 4];

  for (int i = 0; i < list.length; i++) print(list[i]);
  int i = list.length, j = list.length - 1;
  while (i-- > 0) print(list[i]);
  do print(list[j]); while (j-- > 0);

  for (var i in list) print(i);
  list.forEach((element) => print);
}
