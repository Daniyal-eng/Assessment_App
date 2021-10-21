class QuizMod{
  String?  Category;
  String? type;
  String? difficulty;
  String? question;
  String? correct_answer;
  String? incorrect_answers;

  QuizMod(
  {this.Category, this.type, this.difficulty, this.question,
      this.correct_answer, this.incorrect_answers
});
    QuizMod.fromJson(Map<String,dynamic>json){
      Category = json['category'];
      type = json['type'];
      difficulty = json['difficulty'];
      question = json['question'];
      correct_answer = json['correct_answer'];
      incorrect_answers = json['incorrect_answers'];

    }
}
