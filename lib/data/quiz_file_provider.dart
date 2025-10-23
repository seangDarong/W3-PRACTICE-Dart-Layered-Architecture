import 'dart:io';
import 'dart:convert';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz (){
    final file = File(filePath);
    final content = file.readAsStringSync();
    final data = jsonDecode(content);
    var questionJson = data['questions'] as List;
    var questions = questionJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice:q['goodChoice'],
        point: q ['point'],
      );
    }).toList();

    var questionMap = {for (var q in questions) q.id : q} ;

    var playerJson = data['players'] as List;
      var players = playerJson.map((p) {
      var answerJson = p['answers'] as List;
      var answers = answerJson.map((a) {
        var question = questionMap[a['questionId']];
      return Answer(
        id: a ['id'],
        question: question!,
        answerChoice: a ['answerChoice']
      );
    }).toList();
        return Player(
          id :p['id'],
          playerName : p['playerName'],
          score: p['score'],
          answers: answers
        );
      }).toList();
    return Quiz(questions: questions , players: players);
    
  }
}