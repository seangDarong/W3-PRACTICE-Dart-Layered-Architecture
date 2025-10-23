import 'dart:io';

import '../domain/quiz.dart';


class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {

    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name:');
      String? playerName = stdin.readLineSync();

    if (playerName == null || playerName.isEmpty){
      print('--- Quiz Finished ---');
      break;
    }

    Player player = Player (playerName: playerName);
    quiz.players.add(player);

    for (var question in quiz.questions) {
      print('Question: ${question.title} - ( ${question.point} points)');
      print('Choices: ${question.choices}');
      stdout.write('Your answer: ');
      String? userInput = stdin.readLineSync();

      // Check for null input
      if (userInput != null && userInput.isNotEmpty) {
        Answer answer = Answer(question: question, answerChoice: userInput);
        quiz.addAnswer(answer);
        player.addAnswer(question, userInput);
      } else {
        print('No answer entered. Skipping question.');
      }

      print('');
      
    }
    int scorePer = quiz.getScoreInPercentage(player);
    int score = quiz.getScore(player);
    print('${player.playerName}, Your score: ${scorePer} % correct');
    print('${player.playerName}, Your score in point: ${score}');
    
    
    for (var player in quiz.players) {
      int playerScore = quiz.getScore(player);
    print('Player: ${player.playerName}\t\t\t\tScore: ${playerScore}');
    }
    }
  }
}
