import 'dart:io';

class Question {
  String questionText;
  List<String> options;
  int correctOptionIndex;

  Question(this.questionText, this.options, this.correctOptionIndex);
}

void main() {

  List<Question> questions = [
    Question("What is the dart language used for?", ["programing", "animation", "text stylish", "develop user interface"], 0),
    Question("Which is example of computer input device?", ["RAM", "battery", "CPU", "keybord"], 3),
    Question("Which is the computer OS?", ["Android", "play store", "Windows",], 2),
  ];

  int score = 0;

  print("Welcome to the Simple Quiz Game!");

  stdout.write("1. Enter your Name: ");
  var name = stdin.readLineSync();
   stdout.write("2. Enter your Last Name: ");
  var lname = stdin.readLineSync();
  print("");

  print("Answer the following questions:");
  for (var i = 0; i < questions.length; i++) {
    print("\nQuestion ${i + 1}: ${questions[i].questionText}");

    for (var j = 0; j < questions[i].options.length; j++) {
      print("${j + 1}. ${questions[i].options[j]}");
    }

    stdout.write("Enter your choice (1-${questions[i].options.length}): ");
    String? input = stdin.readLineSync(); 

    
    if (input != null && int.tryParse(input) != null) {
      int userChoice = int.parse(input) - 1; 
      if (userChoice == questions[i].correctOptionIndex) {
        print("Correct!");
        score += 10; 
      } else {
        print("Wrong! The correct answer is: ${questions[i].options[questions[i].correctOptionIndex]}");
      }
    } else {
      print("Invalid input. Skipping question.");
    }
  }
  print("");
  print("\Hi $name $lname! You have complete the simple questions.");
  print(" Your final score is:, $score/${questions.length * 10}");
}