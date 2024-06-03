class Question {
  String? question;
  List<String>? options;
  String? answer;
  int? level;

  Question({this.question, this.options, this.answer, this.level});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options']?.cast<String>();
    answer = json['answer'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['answer'] = answer;
    data['level'] = level;
    return data;
  }

  static List<Question> fromJsonList(List<dynamic>? list) {
    if (list == null || list.isEmpty) return [];
    return list.map((item) => Question.fromJson(item)).toList();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options,
      'answer': answer,
      'level': level
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] != null ? map['question'] as String : null,
      options: map['options'] != null
          ? List<String>.from((map['options'] as List<String>))
          : null,
      answer: map['answer'] != null ? map['answer'] as String : null,
      level: map['level'] != null ? map['level'] as int : null,
    );
  }

  @override
  String toString() =>
      'Question(question: $question, options: $options, answer: $answer, level: $level)';
}
