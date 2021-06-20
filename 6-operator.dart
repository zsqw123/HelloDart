main(List<String> args) {
  Builder()
    ..method = 'POST'
    ..url = 'https://github.com'
    ..version = 2.0
    ..build();
  var op1 = OpTest(1);
  var op2 = OpTest(2);
  print(op1 + op2);
  print(~op2);
  print(3 / 2);
}

class Builder {
  String url = '';
  String method = 'GET';
  num version = 1;
  build() => print('$method $url HTTP/$version');
}

class OpTest {
  var inner = 1;
  OpTest([this.inner = 1]);
  int operator +(OpTest o) => this.inner + o.inner;
  int operator ~() => ~inner;
}
