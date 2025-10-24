import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  // Create 2 questions and the quiz
  Question q1 =
      Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4");

  Question q2 =
      Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5");

  Question q3 = 
      Question(title: "12+3", choices: ["15","18","16"], goodChoice: "15");

    Question q4 = 
      Question(title: "20-10", choices: ["10","11","15"], goodChoice: "10");
  Player player = Player(playerName: "darong");
  Player player2 = Player(playerName: "boeun");
  Quiz quiz = Quiz(questions: [q1, q2],players: [player]);
  Quiz quiz2 = Quiz(questions:[q3, q4],players: [player2]);

  

  test('All answers are good (100%)', () {
    // Create the answer here
    Answer a1 = Answer(question: q1, answerChoice: "4");
    Answer a2 = Answer(question: q2, answerChoice: "5");
    
    player.answers = [a1, a2];
    // Check something
    expect(quiz.getScoreInPercentage(player), equals(100));
  });

  test('Some Answer are wrong (50%)', () {
    Answer a3 = Answer(question: q3 ,answerChoice: "15");
    Answer a4 = Answer(question: q4, answerChoice: "11");
    

    player2.answers = [a3, a4];
    expect(quiz2.getScoreInPercentage(player2), equals(50));

    expect(quiz2.getQuestionById(q3.id).goodChoice, equals("15"));
    expect(quiz2.getQuestionById(q4.id).goodChoice, equals("10"));
    
  });

  
}