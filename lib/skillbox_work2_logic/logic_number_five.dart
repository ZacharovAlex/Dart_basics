class FindNumbersWords {
  static const Map<String, int> _numbers = {
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'zero': 0,
  };

  Set<int> findNumbers(List<String> data) {
    var answerSet = <int>{};
    for (var word in data) {
      word = word.replaceAll(' ', '');
      if (_numbers.containsKey(word.toLowerCase())) {
        answerSet.add(_numbers[word]!);
      }
    }
    return answerSet;
  }
}
