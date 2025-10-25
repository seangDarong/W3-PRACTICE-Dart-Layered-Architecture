
import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';
const filePath = 'data/data.json';
void main() {

  QuizRepository quizRepo = QuizRepository(filePath);
  // List<Question> questions = [
  //   Question(
  //       title: "Capital of France?",
  //       choices: ["Paris", "London", "Rome"],
  //       goodChoice: "Paris",
  //       point: 10),
        
  //   Question(
  //       title: "2 + 2 = ?", 
  //       choices: ["2", "4", "5"], 
  //       goodChoice: "4",
  //       point: 50),
  // ];

  // Quiz quiz = Quiz(questions: questions);
  Quiz quiz = quizRepo.readQuiz();
  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();
  quizRepo.writeQuiz(quiz);

}
