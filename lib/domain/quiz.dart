import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  int point;

  // Accept an optional id. If null or empty, generate a UUID.
  Question(
      {String? id,
      required this.title,
      required this.choices,
      required this.goodChoice,
      this.point = 1})
      : id = (id == null || id.isEmpty) ? uuid.v4() : id;
}

class Answer {
  final String id;
  final Question question;
  final String answerChoice;

  Answer(
      {String? id,required this.question,
      required this.answerChoice,
      })
      : id = id ?? uuid.v4();

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }

  @override
  String toString() {
    return 'id: ${id}\n Question: ${question}\n AnswerChoice: ${answerChoice}';
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({required this.questions, required this.players}) : id = uuid.v4();

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  int getScoreInPercentage(Player player) {
    int totalScore = 0;
    for (Answer answer in player.answers) {
      if (answer.isGood()) {
        totalScore++;
      }
    }
    return ((totalScore / questions.length) * 100).toInt();
  }

  int getScore(Player player) {
    int totalSCore = 0;
    for (Answer answer in player.answers) {
      if (answer.isGood()) {
        totalSCore += answer.question.point;
      }
    }
    return totalSCore;
  }

  Question getQuestionById(String id) {
    return questions.firstWhere((q) => q.id == id);
  }

  Answer getAnswerById(String id) {
    return answers.firstWhere((a) => a.id == id);
  }
}

class Player {
  final String id;
  String playerName;
  int score;
  List<Answer> answers;

  Player({String? id,required this.playerName, this.score = 0,List<Answer>? answers}) : id = uuid.v4(), answers = answers ?? [];

  void addAnswer ( Question question,String choice) {
    Answer answer = Answer(question: question, answerChoice: choice);
    answers.add(answer);
  }


}
