void main() {
  //var x = 10; // Type Inference
  // x = "Hello"; // Error !
  int? x; // Null Safety
  x = 10;
  print(x);
  String name = "Flutter"; // 'Flutter'
  String msg = "Let' \\s  go";
  bool b = true;
  print('Started learning ${msg}');

  int len = 10;
  int breadth = 20;

  print('The area is : ${len * breadth}');
  //  print(x.runtimeType);

  // final & const
  final double length; // can be assigned at runtime
  length = 30;

  const double PI = 3.14; // value should be know at compile time !
  // PI = 3.14565;
}
