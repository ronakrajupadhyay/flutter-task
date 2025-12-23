// void main() {
//   int num = 7;
//
//   if (num % 2 == 0) {
//     print("Even number");
//   } else {
//     print("Odd number");
//   }
// }
// void main() {
//   int num = -5;
//
//   if (num > 0) {
//     print("Positive number");
//   } else if (num < 0) {
//     print("Negative number");
//   } else {
//     print("Zero");
//   }
// }
import 'dart:io';

void main() {
  print("Enter your weight:");
  double weight = double.parse(stdin.readLineSync()!);

  print("Enter your height:");
  double height = double.parse(stdin.readLineSync()!);


  double bmi = weight / (height * height);

  print("BMI: ${bmi.toStringAsFixed(2)}");

  if (bmi < 18.5) {
    print("Underweight");
  } else if (bmi < 25) {
    print("Normal weight");
  } else if (bmi < 30) {
    print("Overweight");
  } else {
    print("Obese");
  }
}
