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

  var list = [1, 2, 3, 4];

  for (int i = 0; i < list.length; i++) print(list[i]);
  int i = list.length, j = list.length - 1;
  while (i-- > 0) print(list[i]);
  do print(list[j]); while (j-- > 0);

  for (var i in list) print(i);
  list.forEach((element) {
    return;
  });
}
