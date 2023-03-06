class FindWords {
  final List<String> data;

  FindWords(this.data);

  Map<String, int> findWords() {
    var answerMap = <String, int>{};
    for (var word in data) {
      answerMap.containsKey(word) ? answerMap.update(word, (value) => value + 1) : answerMap[word] = 1;
    }
    return answerMap;
  }
}
