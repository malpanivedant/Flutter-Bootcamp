void main() {
  //var studentOne = Student(); // Calling the default ctor
  // print(studentOne.id);
  //studentOne.study();
  //studentOne.bunk();

  //var studentTwo = Student(2, 'Tim');
  //studentTwo.bunk();

  //var studentThree = Student();
  //var studentFour = Student(name: 'Johnny', id: 4);

  // Student studentFive = Student.getStudentInstance(10, 'John');
  // print(studentFive.name);

  // Product productOne = Product(title: "Mobile", id: 1);
  // print(productOne.title);

  // productOne.title = "Cellphone"; // error when used with final
  // print(productOne.title);

  // Product productOne = Product();
  // print(productOne.Title); // calls get
  // productOne.Title = "LED TV"; // calls set

  Manager mgr = Manager('Anil', "XYZ", 20000.00, 400000.00);

  print(mgr.calculateSalary());
}

// properties & behaviour
class Student {
  int? id; // instance variable
  String? name;

// either default or parameterized
// default constructor
  // Student() {
  //   this.id = 0;
  //   this.name = "Harry";
  // }

// parameterized constructor
  // Student(id, name) {
  //   this.id = id;
  //   this.name = name;
  // }

  // short-cut way - parameterized constructor
  // Student(this.id, this.name);

  // optional positional parameters
  // Student([this.id = 0, this.name = "unknown"]);

// optional named parameters
  // Student({this.id = 0, this.name = "unknown"});

  // Named Constructor
  // Student.getStudentInstance();

  // Named Constructor - accepts parameter
  Student.getStudentInstance(this.id, this.name);

  void study() {
    print('${name} is studying !');
  }

  void bunk() {
    print('${name} is bunking classes !');
  }
}

class Product {
  final int id = 1;
  String _title = "unknown";

  // String get Title {
  //   return _title;
  // }
  // OR
  String get Title => _title;

  // void set Title(String titleToBeSet) {
  //   this._title = titleToBeSet;
  // }
  // OR
  void set Title(String titleToBeSet) => this._title = titleToBeSet;

  // Product({this.id = 0, this._title = "unknown"});
}

class Employee {
  String name;
  String company;
  double salary;

  Employee({this.name = "", this.company = "", this.salary = 0.0});

  double calculateSalary() => salary;
}

class Manager extends Employee {
  double stocks = 200000.00;
  Manager(String name, String company, double salary, double stocks)
      : super(name: name, company: company, salary: salary) {
    this.stocks = stocks;
  }

  @override
  double calculateSalary() => salary + stocks;
}
