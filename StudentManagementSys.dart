void main() {
  // Create instances of Student and Teacher
  Student student = Student(
      name: "Ifti Bin Islam Mahin",
      age: 20,
      address: "xyz,Dhaka",
      studentID: "202202",
      grade: "A",
      courseScores: [90, 85, 82]);

  Teacher teacher = Teacher(
      name: "Mrs.Smith",
      age: 35,
      address: "456 Oak St.",
      teacherID: "30330",
      coursesTaught: ["Math", "English", "Bangla"]);

  // Display roles and details
  student.displayRole();
  print("\n");
  teacher.displayRole();
}

abstract class Role {
  void displayRole();
}

class Person extends Role {
  final String name;
  final int age;
  final String address;

  Person({required this.name, required this.age, required this.address});

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Role: Person");
  }
}

class Student extends Person {
  final String studentID;
  final String grade;
  final List<int> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    int total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  @override
  void displayRole() {
    print("Student Information: ");
    print("\n");
    print("Role: Student");
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    //print("Student ID: $studentID, Grade: $grade");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(2)}");
  }
}

class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  void displayCoursesTaught() {
    print("Courses Taught:\n - ${coursesTaught.join("\n - ")}");
  }

  @override
  void displayRole() {
    print("Teacher Information: ");
    print("\n");
    print("Role: Teacher");
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    //print("Teacher ID: $teacherID");
    displayCoursesTaught();
  }
}
