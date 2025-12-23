import 'dart:io';
import 'dart:math';

void main() {
  print("🎮 Welcome to Number Guessing Game");

  int secretNumber = generateRandomNumber(10);
  bool isGuessed = false;

  while (!isGuessed) {
    int userGuess = takeUserInput();

    String result = checkGuess(userGuess, secretNumber);
    print(result);

    switch (result) {
      case "Correct":
        isGuessed = true;
        print("🎉 You won the game!");
        break;
      case "Too High":
        print("Try a smaller number");
        break;
      case "Too Low":
        print("Try a bigger number");
        break;
    }
  }
}
int generateRandomNumber(int max) {
  Random random = Random();
  return random.nextInt(max) + 1;
}
int takeUserInput() {
  print("Enter your guess (1–10):");
  return int.parse(stdin.readLineSync()!);
}
String checkGuess(int guess, int secret) {
  if (guess > secret) {
    return "Too High";
  } else if (guess < secret) {
    return "Too Low";
  } else {
    return "Correct";
  }
}

