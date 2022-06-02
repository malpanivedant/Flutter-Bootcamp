main() {
  // implicit list
  var cars = ["BMW", "AUDI", 10]; // not strongly typed
  cars.add("Ferrari");

  // Type
  List<String> moreCars = List.filled(10, "BMW");

// List of Map
  var people = [
    {"John": 32},
    {"John": 32},
    {"John": 32}
  ];

// Set Type
  Set personWithSetType = {"Virat", 30};

// Set Type
  Set<String> mycities = Set<String>.from(["Pune", "Delhi", "Bengaluru"]);
  print(mycities.contains("Delhi"));



// Map Type
  Map<String, String> fruits = {
    "apple": "red",
    "banana": "yellow",
    "guava": "green"
  };

  fruits.forEach((key, value) => "Key : ${key} , Value : ${value}" )

  print('\n');
  for(String key in fruits.keys){
    print(key);
  }
  print('\n');

    for(String value in fruits.values){
    print(value);
  }
  print('\n');
  print(fruits["apple"]);
}
