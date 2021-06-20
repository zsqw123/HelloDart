import 'dart:io';

class Phone {
  void call() {}
}

mixin QQ {
  void chat() {}
}

class IPhone extends Phone with QQ {}

main() {
  print("wa");
  File file = File("awwwa");
  print(file.absolute);
}
