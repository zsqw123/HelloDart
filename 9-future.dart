import 'dart:io';

main(List<String> args) {
  Future<String> futureIoData = Future(() {
    sleep(Duration(seconds: 2));
    return 'awa';
  });

  futureIoData.then((value) {
    print(value);
    return 1;
  }).then((value) {
    print('qwq');
    throw Exception('=v=');
  }).catchError((e) {
    print(e);
  });

  Future.delayed(Duration(seconds: 1));
  Future.value(1);
  Future.error(Exception());
  Future.microtask(() => 1);

  Future<String> asyncData() async {
    var res1 = Future(() {
      sleep(Duration(seconds: 10));
      return 'awa';
    });
    var res2 = Future(() {
      sleep(Duration(seconds: 5));
      return 'qwq';
    });
    return await res1 + await res2;
  }

  asyncData().then((value) => print(value));
}
