class FindWords {
  final List<String> _data;

  FindWords(this._data);

  Map<String, int> findWords() {
    var answerMap = <String, int>{};
    for (var word in _data) {
      answerMap.containsKey(word) ? answerMap.update(word, (value) => value + 1) : answerMap[word] = 1;
    }
    return answerMap;
  }
}
