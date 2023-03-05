class ParseStringForNum {
  final String data;

  ParseStringForNum(this.data);

  List<dynamic> parsing() {
    var j;
    var temp = [];                   //TODO test  //fdh5 fdf6.668.90 gf98. fd-8jjk-7.78j --66 -54-76.9kj-8..5d  -0.43-
    var answer = [];
    for (var i = 0; i < data.length; i++) {
      j = int.tryParse(data[i]);
      if (j != null) {
        temp.add(j);
        if (i == data.length - 1 && temp.isNotEmpty) {
          answer.add(arrayToNum(temp));
          temp.clear();
        }
      } else if (temp.isNotEmpty) {
        if (i < data.length - 1 && data[i] == '-' && int.tryParse(data[i + 1]) != null) {
          answer.add(arrayToNum(temp));
          temp.clear();
          temp.add(data[i]);
          continue;
        }
        if (data[i] == '.' && !temp.contains('.')) {
          if (i == data.length - 1) {
            answer.add(arrayToNum(temp));
            temp.clear();
            continue;
          } else {
            temp.add(data[i]);
          }
        } else {
          answer.add(arrayToNum(temp));
          temp.clear();
          continue;
        }
      } else if (i < data.length - 1 && data[i] == '-' && int.tryParse(data[i + 1]) != null) {
        temp.add(data[i]);
      }
      {
        continue;
      }
    }
    return answer;
  }

  num? arrayToNum(List<dynamic> arrayOfDigits) {
    var result = '';
    result = arrayOfDigits.join('');
    return int.tryParse(result) ?? double.tryParse(result);
  }
}
