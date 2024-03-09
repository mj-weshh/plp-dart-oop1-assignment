import 'dart:io';


abstract class Printable {
  void printInfo();
}


class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print("Animal makes a sound");
  }
}


class Dog extends Animal implements Printable {
  int age;

  Dog(String name, this.age) : super(name);

  @override
  void makeSound() {
    print("Dog barks");
  }

  @override
  void printInfo() {
    print("Dog: $name, Age: $age");
  }
}


class FileDataReader {
  static List<String> readLinesFromFile(String filePath) {
    try {
      File file = File(filePath);
      List<String> lines = file.readAsLinesSync();
      return lines;
    } catch (e) {
      print("Error reading file: $e");
      return [];
    }
  }
}

void main() {

  Dog myDog = Dog("Bosco", 5);

  myDog.makeSound();

  myDog.printInfo();


  List<String> fileLines = FileDataReader.readLinesFromFile("./text.txt");
  if (fileLines.isNotEmpty) {
    print("message from text.txt:");
    for (String line in fileLines) {
      print(line);
    }
  } else {
    print("No message in the file.");
  }
}
