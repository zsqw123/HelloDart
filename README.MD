# Kotlin to Dart学习记录

作者网站(Writer WebSite): [可爱怪的窝](https://zsqw123.fun/)

## 基础

### 基本数据类型

与`Kotlin`不同, `Dart`的基本数据类型只有`int`,`double`,`num`,`bool`这几种(其实也不是基本数据类型, 都是对象), `int`和`double`都是`num`的子类, 均有转换方法:`toInt()`,`toDouble()`等方法, `num`会进行自动类型预测.

```dart
main(List<String> args) {
  int a = 1; // 1
  bool b = false; // false
  double c = 1; // 1.0
  num d = 2; // 2
  num e = 1.1; // 1.1
}
```

### 变量

对于编译器可以推断的类型, 可以类似`Kotlin`的`var`来声明, 同样的, `Dart`的`final`也和`Kotlin`的`val`保持一致, 同时, `Dart`的`const`也与`Kotlin`的`const val`一致.

```dart
var f=1
final g=1;
const h=1;
```

#### Object dynamic

`Dart`中一切皆对象，都继承于`Object`, 所以可以用`Object`定义任何变量, 且赋值后类型依旧是`Object`, 但是可以使用`as`关键字强转类型(与kotlin一致), 同样的, 也有`is`关键字判断类型

```dart
class Hehe {
  p() => 'hehe';
}
...
Object o = Object();
o = 1;
print(o); // 1
o = Hehe();
print(o is Hehe); // true
print((o as Hehe).p()); // hehe
```

`dynamic`与`Object`相似, 区别在于: `Object`会在编译阶段检查类型，而`dynamic`不会在编译阶段检查类型, `var`声明的变量未赋值的时候就是`dynamic`类型

```dart
dynamic oo = Object();
oo.p(); // 编译通过 运行出错, 因为Object没这方法
```

#### setter/getter



### 基础类型数组

`Kotlin`有无装箱开销的专门的类来表示原生类型数组: `ByteArray`、 `ShortArray`、`IntArray` 等等。这些类与 `Array` 并没有继承关系，但是它们有同样的方法属性集。而`Dart`中没有原生类型这一说, 在数组这一点上`Dart`与大多数其他语言也是一致的:

```dart
List<int> aa = [1, 2, 3];
List bb = [1, 2, false];
var cc = [1, 2, false];
const dd = [1, 2, false]; // 注意:const声明的数组无法进行添加删除元素等操作
final ee = [1, 2, false];
```

`Dart`声明`Map`也是比较方便的: 就像`Json`一样:

```dart
var map = {1: 1, 2: "awa", "emm": "2333"};
```

### 字符串模板

字符串字面值可以包含*模板表达式*，模板表达式以美元符（`$`）开头，由一个简单的名字构成, 或者用花括号括起来的任意表达式, 这一点与`Kotlin`一致

在`Dart`中`''`与`""`功能一致, 这一点和`Python`比较像.

```dart
var i = 10;
print("i = $i"); // 输出"i = 10"
var s='awa';
print("$s.length is ${s.length}"); // 输出"awa.length is 3"
```

同时你可以使用`'''`来进行纯文本书写, 且这里可以使用`\n`,`${}`等模板和转义操作, 需要注意的是纯文本会被如实记录, 哪怕是你代码缩进的`tab`

如果单纯只想纯文本而不想使用模板及转义操作, 可以在前面加`r`

```dart
var aaa = '''
s$s
\$''';
print(aaa);
var bbb = r'''
s$s
\$''';
print(bbb);
```

输出如下:

```shell
sawa
$
s$s
\$
```

## 函数

### 嵌套函数

`Dart`允许嵌套函数, 这一点与`Kotlin`一致：

```dart
main(List<String> args) {
  awa() {}
  awa();
}
```

### 闭包

`Dart`的函数可以作为参数传递, 这一点也和`Kotlin`一致, 但是`Dart`不支持闭包内返回(这一点和`Java8`的`lambda`很像), 而`Kotlin`可以选择通过标签返回到任意一层外层函数

`Dart`对于只有一行代码的闭包, 可以使用`=>`

当然, 闭包也可也叫做匿名函数, 随你们怎么叫...(

```dart
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
```

对于参数的数量和类型符合的闭包, 可以直接用其函数名传入作为参数

```dart
int pram1(int a) => a;
int pram2(int a, int b) => a + b;
int func1(int f1(int a)) => f1(1);
int func2(int f2(int a, int b)) => f2(1, 2);
print(func1(pram1));
print(func2(pram2));
```

### 循环

与`c`,`Java`,`cpp`一致, `Dart`没有与他们有什么区别, 还有啥break continue if-else之类的都是一样的

```dart
  var list = [1, 2, 3, 4];

  for (int i = 0; i < list.length; i++) print(list[i]);
  int i = list.length, j = list.length - 1;
  while (i-- > 0) print(list[i]);
  do print(list[j]); while (j-- > 0);
```

同时对于遍历, 也拥有了一些类似`Kotlin`的一些特性:

```dart
for (var i in list) print(i);
list.forEach((element) => print);
```

### 参数传递

`Dart`允许默认参数, 可选参数, 必须参数等方式进行传递, 但引入了`{}`和`[]`, 个人认为不如`Kotlin`做的方便

```dart
// 三个参数要摆对位置和类型传入
p1(num a, num b, num c) {}
p1(1, 2, 3);
// 要摆对位置和类型, 但数量可以不固定
p2([num a = 0, num b = 1]) {}
p2();p2(1);p2(1, 2);
// 一定要声明参数名, 非required对象需要赋初值, 否则触发空安全
p3({required num a, num b = 1, num c = 0}) {}
p3(a: 1);p3(a: 1, b: 2);p3(a: 1, b: 2, c: 3);
// 组合使用
p4(num a, num b, [num c = 0]) {}
p5(num a, num b, {num d = 1, num e = 2}) {}
```

### 扩展函数

`Dart >= 2.7.0`. 类似于`Kotlin`的扩展函数, 但`Dart`的扩展函数只能位于顶层函数(目前是这样的, Dart: 2.13.3), 而`Kotlin`的扩展函数可以只在单个类生效

但是注意: dynamic类型不能使用扩展方法

```dart
extension p on Object {
  pr() => print(this);
}
...
1.pr(); // 1
```

## 类

### 构造函数

`Dart`更只允许一个类存在一个默认构造函数, 但是还可以通过`命名构造函数`或`重定向构造函数`实现构造, 个人认为他们像是工厂方法(`Factory`), 当然, 也可以使用`[]`,`{}`使构造方法可以达到可变参数, 比如说可以这样:`Point([this.x = 1, this.y = 1])`

```dart
class Point {
  int x = 0, y = 0;
  Point(this.x, this.y);
  Point.alongX(int x) : this(x, 0); // 重定向
  Point.fromList(List<int> list) { // 命名构造
    x = list[0];
    y = list[1];
  }
}
...
Point p0 = Point(1, 2);
Point p1 = Point.alongX(1);
Point p2 = Point.fromList([1, 2]);
```

#### 初始化列表

初始化列表会在构造方法体之前执行, 使用逗号分隔初始化表达式, 可以用来初始化`final`类型的属性

```dart
class PointWithDistance {
  int x, y;
  final int distance;
  PointWithDistance(this.x, this.y) : distance = x + y;
}
...
PointWithDistance pd = PointWithDistance(1, 2);
print(pd.distance); // 3
```

#### 继承父类构造

子类并不会继承父类的构造函数, 这需要手动操作, 调用`super`即可, 父类是无参构造的话可以省略`super`进行构造

```dart
class ThreeDimensionPoint extends Point {
  int z;
  ThreeDimensionPoint(this.z) : super(0, 0);
  ThreeDimensionPoint.x1(this.z) : super.alongX(1);
}
```

#### 常量构造和工厂构造

常量构造的要求是所有可以实例化的变量都是`final`, 且不能有函数体.

```dart
class ConstPoint {
  final int x, y;
  const ConstPoint(this.x, this.y);
}
```

工厂构造, `factory`关键字, 用来做单例模式, 像下面这样:

```dart
class FactoryPoint {
  static FactoryPoint? ins;
  factory FactoryPoint() {
    if (ins == null) ins = FactoryPoint();
    return ins!;
  }
}
```

当然, 也可以传入参数进行制造单例

### 继承/混入

#### 接口/抽象类

需要注意的是, `Dart`中不存在接口, 但可以用抽象类实现接口的功能

```dart
abstract class IM { send(); }
abstract class QQ extends IM { send(); }
mixin WeChat { send(); } // 混入类 其实和 abstract class 差不多
```

我们可以看到, 使用`abstract class`和`mixin`关键字都可以达到声明抽象类的作用, 个人认为唯一的不同是: `mixin`不允许继承其他类, 而`abstract`可以继承父类, 父接口

我们还可以限定`mixin`的使用范围, 比如下面的例子限定了`WeChat`接口只能混入`IM`中

同时我们看到了混入的关键字`with`, 同时我们看到了重写需要注解`@override`

```dart
mixin WeChat { send(); }
class WeXin extends IM with WeChat {
  @override
  send() {}
}
```

需要注意的是, `with`的优先级要比`implements`的优先级要高, 且后面混入的方法如果与之前混入的方法冲突, 则按后面的方法混入.

```dart
abstract class MyChat extends WeXin with WeChat, IM implements IM, WeChat {}
```

## 操作符

### 级联

操作符是`..`, 功能与`kotlin`中的`apply`一致, 建造者模式, 链式调用

```dart
class Builder {
  String url = '';
  String method = 'GET';
  num version = 1;
  build() => print('$method $url HTTP/$version');
}
// 调用:
Builder()
  ..method = 'POST'
  ..url = 'https://github.com'
  ..version = 2.0
  ..build(); // POST https://github.com HTTP/2.0
```

### 重载运算符

`operator`后面添加要重写的运算符以及另一个参数即可

```dart
class OpTest {
  var inner = 1;
  OpTest([this.inner = 1]);
  int operator +(OpTest o) => this.inner + o.inner;
  int operator ~() => ~inner;
}

var op1 = OpTest(1);
var op2 = OpTest(2);
print(op1 + op2); // 3
print(~op2); // -3
```

可以被重写的运算符如下：

| `<`  |     `+`     |     \|     | `[]` List 的 get  |
| :--: | :---------: | :----------: | :---------------: |
| `>`  |  `/` 除以   | `^` 按位异或 | `[]=` List 的 set |
| `<=` | `~/` 整除以 |  `&` 按位与  |   `~` 按位取反    |
| `>=` |     `*`     |     `<<`     |       `==`        |
| `–`  |     `%`     |     `>>`     |                   |

### 空安全

与`Kotlin`一致, 空类型是就是在原来类型后面加个`?`, 同样的, 也可也像`Kotlin`一样使用`?.`避空, 但是`Dart`的`?.`不必像`Kotlin`那样组成链式`?.`调用:

```dart
testNull(Point? p) => print(p?.x?.bitLength) // Kotlin 通常做法
testNull(Point? p) => print(p?.x.bitLength) // Dart 应该这么写
```

#### 延迟初始化

`late`等价于`Kotlin`的`lateinit`

`late final`等价于`Kotlin`的`by lazy`, 也可以用来干单例, 下面的第二句便是一个单例.

```dart
class LazyTest {
  late String awa; // 延迟初始化变量 awa
  static late final LazyTest lazy = LazyTest();
}
```

#### 空安全操作符

`??`: 如果空执行后面的, 否则不执行

`!`: 强制转为非空, 具体用法如下:

```dart
Point? p;
p ??= Point(); // p 为空, 赋值 Point();
p = p ?? Point(); // p 为空,返回 Point();
p!.x; // 强制 p 不为空
```

## 异步

### Future

首先定义一个`Future`, 然后就能用`then`,`catchError`什么的链式调用就完事了, 简单死了

```dart
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
```

#### 其他小玩意

```dart
Future.delayed(Duration(seconds: 1)); // 延迟1s后执行, 后面可以接 then 啥的
Future.value(1); // 直接返回个1, 接 then 啥的处理 1
Future.error(Exception()); // 直接抛出异常, 后面可以接 then catchError 啥的
```

`Future.microtask(() => 1)`, 这个会通过 microtask 队列执行任务, `microtask`的优先级高于普通`event`, 因此会比其他`Future`提前执行.

### await/async

`await`只能在`async`标记的函数中调用, `async`函数的返回值必须为`Future`, 这和`Kotlin`的`async`以及`await`以及`await`有类似之处, 但我测试`Dart`这东西是假异步... 只是看着像同步写法, 而`Kotlin`人家是真的异步了啊....

```dart
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
```

那么`Dart`如何利用好多线程呢, 可以使用`Isolate `, 这里暂不展开...

## 其他

### 泛型

`Dart`与`JVM`语言不一样, `Dart`不会进行类型擦除(事实上尽管JVM做了类型擦除, 我们还是可以通过反射得到类型标记), 这意味着以下的代码会输出 true:

```dart
var strings = <String>[];
print(strings is List<String>); // true
```

`Dart`只支持协变, 别想逆变了, Dart 2.x不允许这么干了

```dart
class Animal {}
class Cat extends Animal {}
class Dog extends Animal {}

List<Animal> animals = <Cat>[]; //ok it's fine
List<Cat> cats = <Animal>[]; // error
```

因此我们可以添加泛型的子类进去, 比如下面的例子在`animals`里面放入了`cats`:

```dart
final animals = <Animal>[];
final cats = [Cat(), Cat(), Cat()];
animals.addAll(cats);
```

#### covariant

`covariant`关键字可以使得传入的类型仍然是`Cat`, 但是其可以向上转型, 因此就会出现下面的情况:

```dart
typedef AnimalFunc(Animal animal);

class TestFun {
  testCat(covariant Cat cat) {}
  testDog(Dog dog) {}
  testAnimal(Animal animal) {}
}

TestFun fun = TestFun();
print(fun.testAnimal is AnimalFunc); // true
print(fun.testCat is AnimalFunc); // true
print(fun.testDog is AnimalFunc); // false
```

这有啥用呢? 比如说我们想要下面的操作, 我们定义一个`Feed`操作, 分别实现喂猫和喂狗:

```dart
abstract class Feed {
  feed(Animal animal);
}

class FeedCat implements Feed {
  @override
  feed(covariant Cat animal) => print('feed cat!');
}

class FeedDog implements Feed {
  @override
  feed(Dog dog) => print('dog no food beacuse it not covariant'); // error
}
```

上述例子中, 如果我不对`Dog`协变, 那么使用`Dog`重写父类方法实际上是错误的, 会直接标红编译不通过, 而`Cat`的参数加上了`corvariant`, 可以向上转型, 因此可以顺利编译通过并执行

#### as

强制类型转型, 同`Kotlin`, 也与`Java`的`(Object)`加在变量之前强制转型效果一致.

```dart
Object o = [1, 2, 3, 4];
o as List; // it's ok
o as Map; // error!
```

### 异常

与其他语言一致, 不同的是捕获指定异常的方式不太相同:

```dart
try {} catch (e) {} finally {}
// catch NoSuchMethodError
try {} on NoSuchMethodError catch (e) {} finally {}
```



---

refer:

[面向 Java 开发者的 Dart 简介 (google.com)](https://codelabs.developers.google.com/codelabs/from-java-to-dart/#1)

[Dart语法篇之基础语法(一) - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/88728224)

code:

[zsqw123/HelloDart (github.com)](https://github.com/zsqw123/HelloDart)
