class Faq {
  final String question;
  final String answer;

  const Faq({
    required this.question,
    required this.answer,
  });

  factory Faq.fromMap(Map<String, dynamic> map) {
    return Faq(
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Faq && other.question == question && other.answer == answer;
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode;
}
