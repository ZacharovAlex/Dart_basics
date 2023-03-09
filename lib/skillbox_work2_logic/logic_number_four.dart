class FindWords {

  Map<String, int> findWords(List<String> data) {
    var answerMap = <String, int>{};
    for (var word in data) {
      answerMap.containsKey(word) ? answerMap.update(word, (value) => value + 1) : answerMap[word] = 1;
    }
    return answerMap;
  }
}
