typedef AnimalFunc(Animal animal);
main(List<String> args) {
  var strings = <String>[];
  print(strings is List<String>);

  final animals = <Animal>[];
  final cats = [Cat(), Cat(), Cat()];
  animals.addAll(cats);

  TestFun fun = TestFun();
  print(fun.testAnimal is AnimalFunc);
  print(fun.testCat is AnimalFunc);
  print(fun.testDog is AnimalFunc);

  Object o = [1, 2, 3, 4];
  o as List;
  // o as Map;

  try {} on NoSuchMethodError catch (e) {} finally {}
}

class TestFun {
  testCat(covariant Cat cat) {}
  testDog(Dog dog) {}
  testAnimal(Animal animal) {}
}

class Animal {}

class Cat extends Animal {}

class Dog extends Animal {}

abstract class Feed {
  feed(Animal animal);
}

class FeedCat implements Feed {
  @override
  feed(covariant Cat animal) => print('feed cat!');
}

class FeedDog implements Feed {
  @override
  feed(Animal animal) => print('dog no food beacuse it not covariant');
}
