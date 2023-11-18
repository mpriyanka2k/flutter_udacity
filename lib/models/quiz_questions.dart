class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledList() {
    final shuffuledList = List.of(answers);
    shuffuledList.shuffle();
    return shuffuledList;
  }
}
