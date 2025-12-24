class Person {
  // Private properties (Encapsulation)
  String _name;
  int _age;

  // 1️⃣ Default Constructor
  Person(this._name, this._age);

  // 2️⃣ Named Constructor
  Person.withName(this._name) : _age = 0;

  // 3️⃣ Factory Constructor
  factory Person.fromMap(Map<String, dynamic> data) {
    return Person(
      data['name'],
      data['age'],
    );
  }

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }

  // Getter for age
  int get age => _age;

  // Setter for age
  set age(int value) {
    if (value >= 0) {
      _age = value;
    }
  }

  // Method
  void displayInfo() {
    print("Name: $_name, Age: $_age");
  }

  // Method with return type
  bool isAdult() {
    return _age >= 18;
  }
}
void main() {
  // Object using default constructor
  Person p1 = Person("Rahul", 20);

  // Object using named constructor
  Person p2 = Person.withName("Amit");
  p2.age = 16;

  // Object using factory constructor
  Person p3 = Person.fromMap({
    "name": "Sneha",
    "age": 25,
  });

  // Display info
  p1.displayInfo();
  p2.displayInfo();
  p3.displayInfo();

  // Check adult
  print("${p1.name} Adult? ${p1.isAdult()}");
  print("${p2.name} Adult? ${p2.isAdult()}");
  print("${p3.name} Adult? ${p3.isAdult()}");
}
